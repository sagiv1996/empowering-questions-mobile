import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/provider/chat_register_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_provider.interface.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_register_provider_interface.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/user.graphql.dart';
import 'package:empowering_questions_mobile/view/components/custom_bubble.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _TestState();
}

class _TestState extends State<RegisterPage> {
  final GroupButtonController _checkboxesController = GroupButtonController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMessages([
        HebrewString.registerPageMessageNumber1,
        HebrewString.registerPageMessageNumber2,
        HebrewString.registerPageMessageNumber3
      ], true);
      context.read<ChatRegisterProvider>().changeTurn();
      context.read<ChatRegisterProvider>().nextStep();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    ChatRegisterProvider chat = context.watch<ChatRegisterProvider>();
    List<Message> messages = chat.messages;
    Turn turn = chat.turn;
    bool? isRadio = chat.suggestions?.values.last;
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("turn $turn"),
            Text("turn ${chat.step}"),
            Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) =>
                        CustomBubble(message: messages[index]))),
            if (chat.turn == Turn.human)
              if (chat.step != SuggestionsTypes.finish)
                BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Column(
                      children: [
                        Card(
                            child: GroupButton(
                          controller: _checkboxesController,
                          isRadio: isRadio!,
                          options: GroupButtonOptions(
                            unselectedTextStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          onSelected: (value, index, isSelected) {
                            if (isRadio) {
                              chat.changeTurn();
                              _addMessage(
                                  HebrewString.registerPageGetAtHebrew(value),
                                  false);

                              switch (chat.step) {
                                case SuggestionsTypes.selectGender:
                                  chat.setSelectedGender(value);
                                  _addMessages([
                                    HebrewString.registerPageMessageNumber4,
                                    HebrewString.registerPageMessageNumber5
                                  ], true);
                                  break;
                                case SuggestionsTypes.selectFrequency:
                                  chat.setSelectedFrequency(value);
                                  _addMessages([
                                    HebrewString.registerPageMessageNumber9,
                                    HebrewString.registerPageMessageNumber10,
                                  ], true);

                                  break;
                                default:
                              }
                              chat.changeTurn();
                              chat.nextStep();
                              _resetSelectedIndex();
                            }
                          },
                          buttons: chat.suggestions!.keys.first,
                          buttonTextBuilder: (selected, value, context) =>
                              HebrewString.registerPageGetAtHebrew(value),
                        )),
                        if (!isRadio)
                          TextButton(
                              onPressed: () {
                                chat.setSelectedCategories(Enum$Categories
                                    .values
                                    .where((element) => _checkboxesController
                                        .selectedIndexes
                                        .contains(Enum$Categories.values
                                            .indexOf(element)))
                                    .toList());
                                List<String> categoriesShouldAddToScreen = chat
                                    .selectedCategories
                                    .map((category) =>
                                        HebrewString.registerPageGetAtHebrew(
                                            category))
                                    .toList()
                                    .cast();
                                _addMessages(
                                    categoriesShouldAddToScreen, false);
                                _addMessages([
                                  HebrewString.registerPageMessageNumber6,
                                  HebrewString.registerPageMessageNumber7,
                                  HebrewString.registerPageMessageNumber8
                                ], true);
                                chat.nextStep();
                                _resetSelectedIndex();
                              },
                              child: const Text(
                                  HebrewString.registerPageMessageNumber11))
                      ],
                    );
                  },
                )
              else
                Mutation$createUser$Widget(
                    builder: (runMutation, result) {
                      if (result!.isLoading) {
                        return const Card(child: Text("Loading..."));
                      }
                      return ElevatedButton(
                          onPressed: () async {
                            String? fcm =
                                await FirebaseMessaging.instance.getToken();
                            runMutation(Variables$Mutation$createUser(
                              fcm: fcm!,
                              frequency: chat.selectedFrequency,
                              gender: chat.selectedGender,
                              categories: chat.selectedCategories,
                            ));
                          },
                          child: const Text(
                              HebrewString.registerPageRegisterButton));
                    },
                    options: WidgetOptions$Mutation$createUser(
                      onError: (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      },
                      onCompleted: (p0, p1) async {
                        context.go(
                          '/',
                        );
                      },
                    )),
          ],
        ));
  }

  void _addMessage(String message, bool isSender) {
    ChatRegisterProvider chatRegisterProvider =
        context.read<ChatRegisterProvider>();
    chatRegisterProvider.addMessage(message, isSender);
  }

  void _addMessages(List<String> messages, bool isSender) {
    ChatRegisterProvider chatRegisterProvider =
        context.read<ChatRegisterProvider>();
    chatRegisterProvider.addMessages(messages, isSender);
  }

  void _resetSelectedIndex() {
    print("Clean indexes");
    _checkboxesController.unselectAll();
  }
}
