import 'package:empowering_questions_mobile/view/components/question_widget.dart';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RefreshController _refreshController;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _userId;
  final List<String> _excludeIds = List<String>.empty(growable: true);
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _userId =
        _prefs.then((SharedPreferences prefs) => prefs.getString("userId")!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.push('/register'),
              icon: const Icon(Icons.settings)),
        ]),
        body: FutureBuilder(
          future: _userId,
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

                return Query$findRandomQuestionsByUserId$Widget(
                  options: Options$Query$findRandomQuestionsByUserId(
                      onComplete: (p0, p1) {
                        FirebaseMessaging.instance.requestPermission();
                        List<String> ids =
                            Query$findRandomQuestionsByUserId.fromJson(p0!)
                                .findRandomQuestionsByUserId
                                .map((question) => question.$_id)
                                .toList();
                        setState(() {
                          _excludeIds.addAll(ids);
                        });
                      },
                      fetchPolicy: FetchPolicy.noCache,
                      variables: Variables$Query$findRandomQuestionsByUserId(
                          userId: snapshot.data!)),
                  builder: (result, {fetchMore, refetch}) {
                    if (result.isLoading) const Text("Loading...");
                    return SmartRefresher(
                      semanticChildCount: 500,
                      enablePullDown: true,
                      enablePullUp: true,
                      onLoading: () async {
                        try {
                          await fetchMore!(
                            FetchMoreOptions(
                                updateQuery:
                                    (previousResultData, fetchMoreResultData) {
                                  previousResultData?[
                                          'findRandomQuestionsByUserId']
                                      .addAll(fetchMoreResultData?[
                                          'findRandomQuestionsByUserId']);

                                  List<String> ids =
                                      Query$findRandomQuestionsByUserId
                                              .fromJson(fetchMoreResultData!)
                                          .findRandomQuestionsByUserId
                                          .map((question) => question.$_id)
                                          .toList();

                                  if (ids.isNotEmpty) {
                                    setState(() {
                                      _excludeIds.addAll(ids.cast<String>());
                                    });
                                    _refreshController.loadComplete();
                                  } else if (ids.isEmpty) {
                                    _refreshController.loadNoData();
                                  }
                                  return previousResultData;
                                },
                                variables:
                                    Variables$Query$findRandomQuestionsByUserId(
                                            userId: snapshot.data!,
                                            excludeIds: _excludeIds)
                                        .toJson()),
                          );
                        } catch (e) {
                          _refreshController.loadFailed();
                        }
                      },
                      controller: _refreshController,
                      onRefresh: () async {
                        try {
                          setState(() {
                            _excludeIds.clear();
                          });
                          await refetch!();
                          _refreshController.loadComplete();
                          _refreshController.refreshCompleted();
                        } catch (e) {
                          _refreshController.refreshFailed();
                        }
                      },
                      child: ListView.builder(
                        itemCount: result.parsedData
                                ?.findRandomQuestionsByUserId.length ??
                            0,
                        itemBuilder: (context, index) {
                          Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId
                              item = result.parsedData!
                                  .findRandomQuestionsByUserId[index];
                          return QuestionWidget(
                            questionString: item.string,
                          );
                        },
                      ),
                    );
                  },
                );
            }
          },
        ));
  }
}
