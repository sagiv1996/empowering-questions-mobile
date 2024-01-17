part of 'chat_cubit.dart';

@immutable
class ChatState {
  final List<Message> messages;
  final bool showGenderSelection;
  final bool showCategoriesSelection;
  final bool showFrequencySelection;
  final bool showNotificationSelection;
  const ChatState(
      {required this.messages,
      this.showGenderSelection = false,
      this.showCategoriesSelection = false,
      this.showFrequencySelection = false,
      this.showNotificationSelection = false,});
  ChatState copyWith({
    List<Message>? messages,
    bool? showGenderSelection,
    bool? showCategoriesSelection,
    bool? showFrequencySelection,
    bool? showNotificationSelection,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      showGenderSelection: showGenderSelection ?? this.showGenderSelection,
      showCategoriesSelection:
          showCategoriesSelection ?? this.showCategoriesSelection,
      showFrequencySelection:
          showFrequencySelection ?? this.showFrequencySelection,
      showNotificationSelection:
          showNotificationSelection ?? this.showNotificationSelection,
    );
  }
}

class Message {
  final String text;
  final bool isSender;

  const Message({required this.text, this.isSender = false});
}
