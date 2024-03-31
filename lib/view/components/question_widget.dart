import 'dart:typed_data';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuestionWidget extends StatelessWidget {
  final Query$findQuestionById$findQuestionById question;
  final Widget? footer;
  final ScreenshotController _screenshotController = ScreenshotController();
  final Function(bool doesUserLikeQuestion, int countUsersLikes)? onFavoriteTap;
  final bool openInNewPageIsAvailable;
  QuestionWidget(
      {super.key,
      required this.question,
      this.footer,
      this.onFavoriteTap,
      this.openInNewPageIsAvailable = false});

  _handlerShareScreen() async {
    String questionString = question.string;
    Uint8List? image = await _screenshotController.captureFromWidget(Center(
      child: Text(questionString),
    ));

    await Share.shareXFiles([
      XFile.fromData(image.buffer.asUint8List(),
          name: "${question.$_id}.jpg", mimeType: "image/jpeg"),
    ], text: questionString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.string,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _handlerShareScreen(),
                  icon: const Icon(Icons.share),
                  color: Colors.purple,
                ),
                Mutation$updateUserIdsLikes$Widget(
                    builder: (runMutation, result) => Badge.count(
                          isLabelVisible: question.countUsersLikes > 0,
                          count: question.countUsersLikes,
                          child: IconButton(
                              onPressed: () {
                                onFavoriteTap!(
                                    !question.doesUserLikeQuestion,
                                    question.doesUserLikeQuestion
                                        ? question.countUsersLikes - 1
                                        : question.countUsersLikes + 1);
                                runMutation(
                                    Variables$Mutation$updateUserIdsLikes(
                                        questionId: question.$_id,
                                        action: question.doesUserLikeQuestion
                                            ? Enum$UserAction.REMOVE
                                            : Enum$UserAction.ADD));
                              },
                              icon: Icon(
                                question.doesUserLikeQuestion
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.red,
                              )),
                        )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.report,
                      color: Colors.redAccent,
                    )),
                if (openInNewPageIsAvailable)
                  IconButton(
                      onPressed: () {
                        context.push('/question/${question.$_id}');
                      },
                      icon: const Icon(
                        Icons.link,
                        color: Colors.lightGreen,
                      )),
              ],
            ),
            footer ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
