import 'package:empowering_questions_mobile/home_page/question_widget.dart';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ScrollController _scrollController = ScrollController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _userId;

  @override
  void initState() {
    super.initState();

    _userId =
        _prefs.then((SharedPreferences prefs) => prefs.getString("userId")!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.go('/register'),
              icon: const Icon(Icons.settings))
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
                } else {
                  return Query$findRandomQuestionsByUserId$Widget(
                    options: Options$Query$findRandomQuestionsByUserId(
                        fetchPolicy: FetchPolicy.noCache,
                        variables: Variables$Query$findRandomQuestionsByUserId(
                            userId: snapshot.data!)),
                    builder: (result, {fetchMore, refetch}) {
                      if (result.isLoading) const Text("Loading...");
                      return SmartRefresher(
                        semanticChildCount: 500,
                        enablePullDown: true,
                        enablePullUp: true,
                        scrollController: _scrollController,
                        onLoading: () async {
                          try {
                            await fetchMore!(FetchMoreOptions(updateQuery:
                                (previousResultData, fetchMoreResultData) {
                              previousResultData?['findRandomQuestionsByUserId']
                                  .addAll(fetchMoreResultData?[
                                      'findRandomQuestionsByUserId']);
                              return previousResultData;
                            }));
                            _refreshController.loadComplete();
                          } catch (e) {
                            _refreshController.loadFailed();
                          }
                        },
                        controller: _refreshController,
                        onRefresh: () async {
                          try {
                            await refetch!();
                            _refreshController.refreshCompleted();
                          } catch (e) {
                            _refreshController.refreshFailed();
                          }
                        },
                        child: ListView.builder(
                          itemCount: result.parsedData
                                  ?.findRandomQuestionsByUserId.length ??
                              0,
                          itemBuilder: (context, index) => QuestionWidget(
                              question: result.parsedData!
                                  .findRandomQuestionsByUserId[index].string),
                        ),
                      );
                    },
                  );
                }
            }
          },
        )
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       CircleAvatar(
        //         foregroundImage:
        //             NetworkImage(UserController.user?.photoURL ?? ''),
        //       ),
        //       Text(UserController.user?.displayName ?? ''),
        //       ElevatedButton(
        //           onPressed: () async {
        //             await UserController.signOut();
        //             context.go('/');
        //           },
        //           child: Text('Logout')),
        //       ElevatedButton(
        //           onPressed: () async {
        //             context.go('/login-page');
        //           },
        //           child: Text('login page')),
        //       ElevatedButton(
        //           onPressed: () async {
        //             context.go('/register');
        //           },
        //           child: Text('register')),
        //     ],
        //   ),
        // ),
        );
  }
}
