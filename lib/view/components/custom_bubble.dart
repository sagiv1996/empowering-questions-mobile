import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_provider.interface.dart';
import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  final Message message;
  const CustomBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) => BubbleSpecialOne(
      text: message.text,
      isSender: message.isSender,
      color: message.isSender
          ? Theme.of(context).secondaryHeaderColor
          : Theme.of(context).focusColor,
      textStyle: TextStyle(
          color: Theme.of(context).textTheme.headlineMedium!.color,
          fontSize: 16));
}
