import 'package:empowering_questions_mobile/database/database.dart';
import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/view/components/question_widget.dart';
import 'package:flutter/material.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  static AppDb db = AppDb();
  late Future<List<QuestionData>> _savedQuestions;

  @override
  initState() {
    super.initState();
    _savedQuestions = db.allSavedQuestions.then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(HebrewString.downloadPageTitle)),
        body: FutureBuilder(
          future: _savedQuestions,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => QuestionWidget(
                          questionString: snapshot.data![index].string!,
                          handlerDownloadButton: () async {
                            await db
                                .deleteQuestionById(snapshot.data![index].id);
                          },
                          questionInDownloads: true,
                        ));
            }
          },
        ));
  }
}
