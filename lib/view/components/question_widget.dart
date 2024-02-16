import 'dart:typed_data';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:like_button/like_button.dart';

class QuestionWidget extends StatelessWidget {
  final Query$findQuestionById$findQuestionById question;
  final Widget? footer;
  final ScreenshotController _screenshotController = ScreenshotController();
  QuestionWidget({
    super.key,
    required this.question,
    this.footer,
  });

  _handlerShareScreen() async {
    Uint8List? image = await _screenshotController.capture();
    await Share.shareXFiles([
      XFile.fromData(image!.buffer.asUint8List(),
          name: "screenShot.jpg", mimeType: "image/jpeg"),
    ], text: "I'd to share with you a empowering question!");
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question.string,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  LikeButton(
                    likeCount: question.countUsersLikes,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.report,
                        color: Colors.redAccent,
                      ))
                ],
              ),
              footer ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
