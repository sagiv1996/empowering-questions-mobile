import 'package:empowering_questions_mobile/api/question.dart';
import 'package:empowering_questions_mobile/provider/questions_provider.dart';
import 'package:empowering_questions_mobile/view/components/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    QuestionsProvider questionsProvider = context.watch<QuestionsProvider>();
    List<Question> questions = questionsProvider.questions;
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.push('/setting-page'),
              icon: const Icon(Icons.settings)),
        ]),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            try {
              questionsProvider.clearQuestion();
              await questionsProvider.fetchRandom();
              _refreshController.refreshCompleted();
            } catch (e) {
              _refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            try {
              final bool noData = await questionsProvider.fetchRandom();
              if (noData) {
                return _refreshController.loadNoData();
              }
              return _refreshController.loadComplete();
            } catch (e) {
              _refreshController.loadFailed();
            }
          },
          child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) => QuestionWidget(
                    question: questions[index],
                    openInNewPageIsAvailable: true,
                  )),
        ));
  }
}
