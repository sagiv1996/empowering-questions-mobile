import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/provider/base_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_provider.interface.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatProvider extends BaseProvider implements ChatProviderInterface {
  final List<Message> _messages = [];
  Turn _turn = Turn.pc;
  @override
  List<Message> get messages => _messages;

  @override
  Turn get turn => _turn;

  @override
  void addMessage(String text, bool isSender) {
    _messages.add(Message(text: text, isSender: isSender));
    notifyListeners();
  }

  @override
  Future<void> addMessages(List<String> messages, bool isSender) async {
    for (String message in messages) {
      if (isSender) await Future.delayed(Durations.long1);
      addMessage(message, isSender);
    }
  }

  @override
  void changeTurn() {
    Turn newTurn = Turn.human;
    if (_turn == Turn.human) {
      newTurn = Turn.pc;
    }
    _turn = newTurn;
    notifyListeners();
  }
}
