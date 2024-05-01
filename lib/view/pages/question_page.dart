import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/view/components/loading_card.dart';
import 'package:empowering_questions_mobile/view/components/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final String questionId;
  const QuestionPage({super.key, required this.questionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Question page"),
    );
  }
}
