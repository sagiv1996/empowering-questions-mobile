import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/view/components/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QuestionPage extends StatelessWidget {
  final String questionId;
  const QuestionPage({super.key, required this.questionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Query$findQuestionById$Widget(
          options: Options$Query$findQuestionById(
              fetchPolicy: FetchPolicy.noCache,
              variables:
                  Variables$Query$findQuestionById(questionId: questionId)),
          builder: (result, {fetchMore, refetch}) {
            if (result.isLoading) return Text("Loading");
            return QuestionWidget(
                questionString: result.parsedData!.findQuestionById.string,
                handlerDownloadButton: () {},
                questionInDownloads: false,
                footer: const Text(
                  HebrewString.questionPageFooter,
                  textAlign: TextAlign.center,
                ));
          }),
    );
  }
}
