import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QuestionWidget extends StatelessWidget {
  final Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId question;
  final String userId;

  const QuestionWidget(
      {super.key, required this.question, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(3),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question.string,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Mutation$rankQuestion$Widget(
                builder: (RunMutation, result) => RatingBar.builder(
                  initialRating: question.avgRanking ?? 0.0,
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    RunMutation(Variables$Mutation$rankQuestion(
                        rank: rating,
                        userId: userId,
                        questionId: question.$_id));
                  },
                ),
                options:
                    WidgetOptions$Mutation$rankQuestion(onCompleted: (p0, p1) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Thank you for rating ${question.$_id}")));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
