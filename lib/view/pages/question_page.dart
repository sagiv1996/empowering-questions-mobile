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
      body: Query$findQuestionById$Widget(
          options: Options$Query$findQuestionById(
              variables:
                  Variables$Query$findQuestionById(questionId: questionId)),
          builder: (result, {fetchMore, refetch}) {
            if (result.data == null) return const LoadingCard();
            return QuestionWidget(
                question: Query$findQuestionById$findQuestionById.fromJson(
                    result.parsedData!.findQuestionById.toJson()),
                onFavoriteTap: (doesUserLikeQuestion, countUsersLikes) {
                  refetch!();
                },
                footer: const Text(
                  HebrewString.questionPageFooter,
                  textAlign: TextAlign.center,
                ));
          }),
    );
  }
}
