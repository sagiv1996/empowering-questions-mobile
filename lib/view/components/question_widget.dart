import 'dart:typed_data';

import 'package:empowering_questions_mobile/api/question.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final bool openInNewPageIsAvailable;

  final ScreenshotController _screenshotController = ScreenshotController();

  QuestionWidget(
      {super.key,
      required this.question,
      this.openInNewPageIsAvailable = false});

  _handlerShareScreen() async {
    String questionString = question.string;
    Uint8List? image = await _screenshotController.captureFromWidget(Center(
      child: Text(questionString),
    ));

    await Share.shareXFiles([
      XFile.fromData(image.buffer.asUint8List(),
          name: "${question.id}.jpg", mimeType: "image/jpeg"),
    ], text: questionString);
  }

  @override
  Widget build(BuildContext context) => Container(
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
                  if (openInNewPageIsAvailable)
                    IconButton(
                        onPressed: () {
                          context.push('/question/${question.id}');
                        },
                        icon: const Icon(
                          Icons.link,
                          color: Colors.lightGreen,
                        )),
                ],
              ),
            ],
          ),
        ),
      );
}
