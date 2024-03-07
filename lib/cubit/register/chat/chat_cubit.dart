import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(messages: []));

  Future<void> addMessages(List<Message> messages,
      {bool showCategoriesSelection = false,
      bool showFrequencySelection = false,
      bool showGenderSelection = false,
      bool showRegisterSelection = false}) async {
    resetSelections();
    for (Message message in messages) {
      if (message.isSender) {
        await Future.delayed(const Duration(milliseconds: 300));
      }
      emit(state.copyWith(messages: state.messages..add(message)));
    }
    if (showCategoriesSelection ||
        showFrequencySelection ||
        showGenderSelection ||
        showRegisterSelection) {
      emit(state.copyWith(
          showCategoriesSelection: showCategoriesSelection,
          showFrequencySelection: showFrequencySelection,
          showGenderSelection: showGenderSelection,
          showRegisterSelection: showRegisterSelection));
    }
  }

  void resetSelections() {
    emit(state.copyWith(
        showCategoriesSelection: false,
        showFrequencySelection: false,
        showGenderSelection: false,
        showRegisterSelection: false));
  }
}
