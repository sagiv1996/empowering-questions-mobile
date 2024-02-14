import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuestionWidget extends StatelessWidget {
  final String questionString;
  final Widget? footer;
  final ScreenshotController _screenshotController = ScreenshotController();
  QuestionWidget({super.key, required this.questionString, this.footer});

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
                questionString,
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
                  )
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
