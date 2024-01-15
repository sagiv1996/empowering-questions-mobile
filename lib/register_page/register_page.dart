import 'package:change_case/change_case.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/register_page/mangment_categories.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/user.graphql.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimatedList _animatedList;
  final ScrollController _scrollController = ScrollController();
  String _state = '';

  late Enum$Genders _gender;
  late List<Enum$Categories> _categories =
      List<Enum$Categories>.empty(growable: true);
  late Enum$Frequency _frequency;

  @override
  void initState() {
    super.initState();

    _animatedList = AnimatedList(
      padding: const EdgeInsets.only(bottom: 130),
      key: _listKey,
      controller: _scrollController,
      initialItemCount: _messages.length,
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
          child: _messages[index],
        );
      },
    );

    _addNewMessage(
        isSender: false,
        text: "Hi ${UserController.user?.displayName} and welcome!",
        durationInMilliSeconds: 1000);
    _addNewMessage(
        isSender: false,
        text:
            "We have created a smart chat that will allow you to easily and quickly register for the application",
        durationInMilliSeconds: 1500);
    _addNewMessage(
        isSender: false,
        text: "The first step be choose your gender",
        durationInMilliSeconds: 1800);
    _changeState(state: 'select gender', durationInMilliSeconds: 2000);
  }

  void _changeState({String state = '', int durationInMilliSeconds = 0}) {
    Future.delayed(Duration(milliseconds: durationInMilliSeconds), () {
      setState(() {
        _state = state;
      });
    });
  }

  void _addNewMessage(
      {required bool isSender,
      required String text,
      int durationInMilliSeconds = 0}) {
    Future.delayed(
        Duration(milliseconds: durationInMilliSeconds),
        () => setState(() {
              _messages
                  .add(_newBubbleSpecialOne(isSender: isSender, text: text));
              _listKey.currentState?.insertItem(_messages.length - 1);
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 130),
                curve: Curves.easeInOut,
              );
            }));
  }

  static Widget _newBubbleSpecialOne(
          {required bool isSender, required String text}) =>
      BubbleSpecialOne(
        text: text,
        isSender: isSender,
        color: isSender ? Color(0xFF1B97F3) : Color(0xFFE8E8EE),
        textStyle: TextStyle(
            color: isSender ? Colors.white : Colors.black, fontSize: 16),
      );

  final List<Widget> _messages = List<Widget>.empty(growable: true);

  Widget _responseOptions() {
    Widget response = Container();
    switch (_state) {
      case 'select gender':
        response = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GroupButton(
              buttons: Enum$Genders.values
                  .where((gender) => gender != Enum$Genders.$unknown)
                  .toList(),
              buttonTextBuilder: (selected, value, context) {
                return value.name;
              },
              onSelected: (value, index, isSelected) {
                _gender = value;

                _changeState(state: '');
                _addNewMessage(isSender: true, text: value.name);
                _addNewMessage(
                    isSender: false,
                    text: 'Great, I wrote it down',
                    durationInMilliSeconds: 500);
                _addNewMessage(
                    isSender: false,
                    text:
                        'The next step will be to choose areas that you would like to improve in your life',
                    durationInMilliSeconds: 800);
                _changeState(
                    state: 'select categories', durationInMilliSeconds: 850);
              },
            ),
          ],
        );
        break;
      case "select categories":
        response = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MangmentCategories(
                onUpdateCategories: (List<Enum$Categories> categories) {
              _changeState(state: '');
              categories.forEach((element) => {
                    _categories.add(element as Enum$Categories),
                    _addNewMessage(
                        isSender: true, text: element.name.toNoCase())
                  });
              _addNewMessage(
                  isSender: false,
                  text: 'you are great',
                  durationInMilliSeconds: 500);
              _addNewMessage(
                  isSender: false,
                  text:
                      'If you want to add more fields beyond the ${categories.length} fields you selected, you can always come back here and add more',
                  durationInMilliSeconds: 800);
              _addNewMessage(
                  isSender: false,
                  text: 'Just before we go to the main screen',
                  durationInMilliSeconds: 1100);
              _addNewMessage(
                  isSender: false,
                  text:
                      'How often would you like to receive empowering questions?',
                  durationInMilliSeconds: 1400);

              _changeState(
                  state: 'select frequency', durationInMilliSeconds: 1500);
            })
          ],
        );
        break;

      case "select frequency":
        response = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GroupButton(
              buttons: Enum$Frequency.values
                  .where((frequency) => frequency != Enum$Frequency.$unknown)
                  .toList(),
              buttonTextBuilder: (selected, value, context) {
                return value.name;
              },
              onSelected: (value, index, isSelected) {
                _changeState(state: '');
                _frequency = value;
                _addNewMessage(isSender: true, text: value.name);
                _addNewMessage(
                    isSender: false,
                    text: "${value.name} it's great",
                    durationInMilliSeconds: 500);
                _addNewMessage(
                    isSender: false,
                    text: 'We immediately register you in the system',
                    durationInMilliSeconds: 800);
                // TODO: register user for system
                _changeState(state: 'done', durationInMilliSeconds: 850);
                _addNewMessage(
                    isSender: false,
                    text:
                        'registration succeeded. May you have an empowering and fun use!',
                    durationInMilliSeconds: 1100);
              },
            ),
          ],
        );
        break;
      case 'done':
        response = Mutation$createUser$Widget(builder: (runMutation, result) {
          if (result!.isLoading) return Card(child: Text("Loading..."));
          return ElevatedButton(
              onPressed: () {
                runMutation(Variables$Mutation$createUser(
                  firebaseId: UserController.user!.uid,
                  frequency: _frequency,
                  gender: _gender,
                  categories: _categories,
                ));
              },
              child: Text("Next Screen"));
        }, options: WidgetOptions$Mutation$createUser(
          onCompleted: (p0, p1) {
            print("Move to next screen");
          },
        ));

        break;
    }
    return Align(
        alignment: Alignment.bottomCenter, child: Container(child: response));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("This is my title ")),
      body: Stack(children: [_animatedList, _responseOptions()]),
    );
  }
}
