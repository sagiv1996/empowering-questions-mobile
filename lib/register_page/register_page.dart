import 'package:change_case/change_case.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/cubit/register/chat/chat_cubit.dart';
import 'package:empowering_questions_mobile/cubit/register/frequency/frequency_cubit.dart';
import 'package:empowering_questions_mobile/register_page/mangment_categories.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/user.graphql.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:empowering_questions_mobile/cubit/register/gennder/gender_cubit.dart";
import "package:empowering_questions_mobile/cubit/register/category/category_cubit.dart";
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ScrollController _scrollController = ScrollController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(title: const Text("This is my title ")),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<ChatCubit>(
                create: (context) => ChatCubit()
                  ..addMessages([
                    Message(
                        text:
                            'Hi ${UserController.user?.displayName ?? ''} and welcome!'),
                    const Message(
                        text:
                            "We have created a smart chat that will allow you to easily and quickly register for the application"),
                    const Message(
                      text: "The first step be choose your gender",
                    )
                  ], showGenderSelection: true)),
            BlocProvider<GenderCubit>(create: (context) => GenderCubit()),
            BlocProvider<CategoryCubit>(
              create: (context) => CategoryCubit(),
            ),
            BlocProvider<FrequencyCubit>(
              create: (context) => FrequencyCubit(),
            )
          ],
          child: Column(
            children: [
              BlocListener<ChatCubit, ChatState>(
                listener: (context, state) => Future.delayed(
                  const Duration(milliseconds: 10),
                  () => _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                ),
                child: Expanded(
                  child: BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) => Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) => BubbleSpecialOne(
                                text: state.messages[index].text,
                                isSender: state.messages[index].isSender,
                                color: state.messages[index].isSender
                                    ? const Color(0xFF1B97F3)
                                    : const Color(0xFFE8E8EE),
                                textStyle: TextStyle(
                                    color: state.messages[index].isSender
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16)),
                          ),
                        ),
                        if (state.showGenderSelection)
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BlocBuilder<GenderCubit, GenderState>(
                                  bloc: GenderCubit(),
                                  builder: (context, state) {
                                    return GroupButton(
                                        buttons: GenderState.genderOptions,
                                        buttonTextBuilder:
                                            (selected, value, context) =>
                                                value.name,
                                        onSelected: (value, index, isSelected) {
                                          context
                                              .read<GenderCubit>()
                                              .selectGender(value);

                                          context
                                              .read<ChatCubit>()
                                              .addMessages([
                                            Message(
                                                text: value.name,
                                                isSender: true),
                                            const Message(
                                                text: "Great, I wrote it down"),
                                            const Message(
                                                text:
                                                    "The next step will be to choose areas that you would like to improve in your life")
                                          ], showCategoriesSelection: true);
                                        });
                                  },
                                ),
                              ])
                        else if (state.showCategoriesSelection)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlocBuilder<CategoryCubit, CategoryState>(
                                bloc: CategoryCubit(),
                                builder: (context, state) => MangmentCategories(
                                    onUpdateCategories:
                                        (List<Enum$Categories> categories) {
                                  context
                                      .read<CategoryCubit>()
                                      .selectCategories(categories);

                                  context.read<ChatCubit>().addMessages(
                                      categories
                                          .map<Message>((category) => Message(
                                              text: category.name.toNoCase(),
                                              isSender: true))
                                          .toList()
                                        ..addAll(
                                          [
                                            const Message(
                                                text: "you are great"),
                                            Message(
                                                text:
                                                    "If you want to add more fields beyond the ${categories.length} fields you selected, you can always come back here and add more"),
                                            const Message(
                                                text:
                                                    "Just before we go to the main screen"),
                                            const Message(
                                                text:
                                                    "How often would you like to receive empowering questions?")
                                          ],
                                        ),
                                      showFrequencySelection: true);
                                }),
                              )
                            ],
                          )
                        else if (state.showFrequencySelection)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlocBuilder<FrequencyCubit, FrequencyState>(
                                  bloc: FrequencyCubit(),
                                  builder: (context, state) => GroupButton(
                                      buttons: FrequencyState.frequencyOptions,
                                      buttonTextBuilder:
                                          (selected, value, context) =>
                                              value.name,
                                      onSelected: (value, index, isSelected) {
                                        context
                                            .read<FrequencyCubit>()
                                            .selectFrequency(value);

                                        context.read<ChatCubit>().addMessages([
                                          Message(
                                              text: value.name, isSender: true),
                                          Message(
                                              text: "${value.name} it's great"),
                                          const Message(
                                              text:
                                                  "All we have to do is confirm the notifications"),
                                        ], showRegisterSelection: true);
                                      }))
                            ],
                          )
                        else if (state.showRegisterSelection)
                          Mutation$upsertUser$Widget(
                              builder: (runMutation, result) {
                            if (result!.isLoading) {
                              return const Card(child: Text("Loading..."));
                            }

                            return ElevatedButton(
                                onPressed: () async {
                                  Enum$Genders gender = context
                                      .read<GenderCubit>()
                                      .state
                                      .selectedGender!;

                                  List<Enum$Categories> categories = context
                                      .read<CategoryCubit>()
                                      .state
                                      .selectedCategories!;

                                  Enum$Frequency frequency = context
                                      .read<FrequencyCubit>()
                                      .state
                                      .selectedFrequency!;

                                  String? fcm = await FirebaseMessaging.instance
                                      .getToken();
                                  runMutation(Variables$Mutation$upsertUser(
                                    firebaseId: UserController.user!.uid,
                                    fcm: fcm!,
                                    frequency: frequency,
                                    gender: gender,
                                    categories: categories,
                                  ));
                                },
                                child: const Text("Register to app"));
                          }, options: WidgetOptions$Mutation$upsertUser(
                            onCompleted: (p0, p1) async {
                              try {
                                String userId =
                                    Mutation$upsertUser.fromJson(p0!)
                                        .upsertUser
                                        .$_id;
                                final SharedPreferences prefs = await _prefs;
                                await prefs.setString("userId", userId);
                                if (context.mounted) {
                                  context.go(
                                    '/',
                                  );
                                }
                              } catch (error) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(error.toString())));
                                }
                              }
                            },
                          ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
