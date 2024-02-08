part of 'chat_cubit.dart';

@immutable
class ChatState {
  final List<Message> messages;
  final bool showGenderSelection;
  final bool showCategoriesSelection;
  final bool showFrequencySelection;
  final bool showRegisterSelection;
  const ChatState({
    required this.messages,
    this.showGenderSelection = false,
    this.showCategoriesSelection = false,
    this.showFrequencySelection = false,
    this.showRegisterSelection = false,
  });
  ChatState copyWith({
    List<Message>? messages,
    bool? showGenderSelection,
    bool? showCategoriesSelection,
    bool? showFrequencySelection,
    bool? showRegisterSelection,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      showGenderSelection: showGenderSelection ?? this.showGenderSelection,
      showCategoriesSelection:
          showCategoriesSelection ?? this.showCategoriesSelection,
      showFrequencySelection:
          showFrequencySelection ?? this.showFrequencySelection,
      showRegisterSelection:
          showRegisterSelection ?? this.showRegisterSelection,
    );
  }
}

class Message {
  final String text;
  final bool isSender;

  const Message({required this.text, this.isSender = true});
}
