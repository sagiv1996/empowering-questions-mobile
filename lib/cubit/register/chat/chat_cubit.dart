import 'package:bloc/bloc.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(messages: []));

  void addMessage(String text,
      {bool isSender = false,
      bool showGenderSelection = false,
      bool showCategoriesSelection = false,
      bool showFrequencySelection = false,
      bool showNotificationSelection = false,
      int delayInMilliSeconds = 0}) {
    final newMessage = Message(text: text, isSender: isSender);

    Future.delayed(
        Duration(milliseconds: delayInMilliSeconds),
        () => emit(ChatState(
              messages: state.messages..add(newMessage),
              showGenderSelection: showGenderSelection,
              showCategoriesSelection: showCategoriesSelection,
              showFrequencySelection: showFrequencySelection,
              showNotificationSelection: showNotificationSelection,
            )));
  }
}
