import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/cubit/register/chat/chat_cubit.dart';
import 'package:empowering_questions_mobile/cubit/register/frequency/frequency_cubit.dart';
import 'package:empowering_questions_mobile/register_page/mangment_categories.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/user.graphql.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:empowering_questions_mobile/cubit/register/gennder/gender_cubit.dart";
import "package:empowering_questions_mobile/cubit/register/category/category_cubit.dart";

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(title: const Text("This is my title ")),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<ChatCubit>(
                create: (context) => ChatCubit()
                  ..addMessage(
                      'Hi ${UserController.user?.displayName} and welcome!',
                      delayInMilliSeconds: 500)
                  ..addMessage(
                      "We have created a smart chat that will allow you to easily and quickly register for the application",
                      delayInMilliSeconds: 800)
                  ..addMessage("The first step be choose your gender",
                      delayInMilliSeconds: 1100, showGenderSelection: true)),
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
              Expanded(
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
                                        context.read<ChatCubit>().addMessage(
                                              value.name,
                                              isSender: true,
                                            );
                                        context.read<ChatCubit>().addMessage(
                                            "Great, I wrote it down",
                                            delayInMilliSeconds: 500);

                                        context.read<ChatCubit>().addMessage(
                                            "The next step will be to choose areas that you would like to improve in your life,",
                                            delayInMilliSeconds: 800,
                                            showCategoriesSelection: true);
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

                                for (var category in categories) {
                                  context.read<ChatCubit>().addMessage(
                                      category.name,
                                      isSender: true);
                                }

                                context.read<ChatCubit>().addMessage(
                                    'you are great',
                                    delayInMilliSeconds: 500);

                                context.read<ChatCubit>().addMessage(
                                    'If you want to add more fields beyond the ${categories.length} fields you selected, you can always come back here and add more',
                                    delayInMilliSeconds: 800);

                                context.read<ChatCubit>().addMessage(
                                    'Just before we go to the main screen',
                                    delayInMilliSeconds: 1100);

                                context.read<ChatCubit>().addMessage(
                                    'How often would you like to receive empowering questions?',
                                    delayInMilliSeconds: 1400,
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

                                      context.read<ChatCubit>().addMessage(
                                            value.name,
                                            isSender: true,
                                          );

                                      context.read<ChatCubit>().addMessage(
                                          "${value.name} it's great",
                                          delayInMilliSeconds: 500);

                                      context.read<ChatCubit>().addMessage(
                                          "All we have to do is confirm the notifications",
                                          delayInMilliSeconds: 800,
                                          showNotificationSelection: true);
                                    }))
                          ],
                        )
                      else if (state.showNotificationSelection)
                        Mutation$createUser$Widget(
                            builder: (runMutation, result) {
                          if (result!.isLoading)
                            return Card(child: Text("Loading..."));
                          return ElevatedButton(
                              onPressed: () {
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

                                runMutation(Variables$Mutation$createUser(
                                  firebaseId: UserController.user!.uid,
                                  frequency: frequency,
                                  gender: gender,
                                  categories: categories,
                                ));
                              },
                              child: Text("Register to app"));
                        }, options: WidgetOptions$Mutation$createUser(
                          onCompleted: (p0, p1) {
                            print("Move to next screen");
                          },
                        ))
                    ],
                  ),
                ),
              ),
            ],
          )

          //  Column(
          //   children: [
          //     BlocListener<ChatCubit, ChatState>(
          //         listener: (context, state) => _scrollController
          //             .jumpTo(_scrollController.position.maxScrollExtent),
          //         bloc: ChatCubit(),
          //         child: ),
          //   ],
          // ),
          ),
    );
  }
}
