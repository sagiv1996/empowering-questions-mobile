import 'package:empowering_questions_mobile/provider/question_provider.dart';
import 'package:empowering_questions_mobile/view/components/loading_card.dart';
import 'package:empowering_questions_mobile/view/components/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  final String questionId;
  const QuestionPage({super.key, required this.questionId});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<QuestionProvider>().fetchById(widget.questionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    QuestionProvider questionProvider = context.watch<QuestionProvider>();

    return Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          if (questionProvider.isLoading) {
            return const LoadingCard();
          }
          return QuestionWidget(question: questionProvider.question!);
        }));
  }
}
