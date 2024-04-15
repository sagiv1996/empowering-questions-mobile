import 'package:empowering_questions_mobile/provider/interfaces/base_provider_interface.dart';

enum Turn { pc, human }

abstract class ChatProviderInterface implements BaseProviderInterface {
  List<Message> get messages;
  Turn get turn;
  void addMessage(String text, bool isSender);
  void addMessages(List<String> messages, bool isSender);
  void changeTurn();
}

class Message {
  final String text;
  final bool isSender;
  const Message({required this.text, this.isSender = true});
}
