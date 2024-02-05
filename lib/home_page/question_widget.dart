import 'dart:typed_data';

import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuestionWidget extends StatelessWidget {
  final String questionId;
  final String questionString;
  final double questionAvgRanking;
  final void Function(double) onAvgRankingUpdate;
  final String userId;
  final ScreenshotController _screenshotController = ScreenshotController();
  final double heightPercentOfTheScreen;
  QuestionWidget({
    super.key,
    required this.userId,
    required this.onAvgRankingUpdate,
    required this.questionId,
    required this.questionString,
    required this.questionAvgRanking,
    this.heightPercentOfTheScreen = 0.8,
  });

  _handlerShareScreen() async {
    Uint8List? image = await _screenshotController.capture();
    await Share.shareXFiles([
      XFile.fromData(image!.buffer.asUint8List(),
          name: "screenShot.jpg", mimeType: "image/jpeg"),
    ], text: "I'd to share with you a empowering question!");
  }

  _handlerClickFavorite() async {
    print("click!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * heightPercentOfTheScreen,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(3),
      child: Screenshot(
        controller: _screenshotController,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questionString,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Mutation$rankQuestion$Widget(
                  builder: (RunMutation, result) => RatingBar.builder(
                    initialRating: questionAvgRanking,
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
                          questionId: questionId));
                    },
                  ),
                  options: WidgetOptions$Mutation$rankQuestion(
                      onCompleted: (p0, p1) {
                    Mutation$rankQuestion result =
                        Mutation$rankQuestion.fromJson(p0!);

                    onAvgRankingUpdate(result.rankQuestion.avgRanking!);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Thank you for rating $questionId")));
                  }),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                    onPressed: () => _handlerShareScreen(),
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                      onPressed: () => _handlerClickFavorite(),
                      icon: const Icon(Icons.favorite))
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
