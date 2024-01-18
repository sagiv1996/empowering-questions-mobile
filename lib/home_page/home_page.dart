import 'package:empowering_questions_mobile/home_page/question_widget.dart';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Query$findRandom$Widget(
      options: Options$Query$findRandom(
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Query$findRandom(
              categories: [Enum$Categories.familyLife],
              gender: Enum$Genders.male)),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) const Text("Loading...");
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: result.parsedData?.findRandom.length ?? 0,
              itemBuilder: (context, index) => QuestionWidget(
                  question: result.parsedData!.findRandom[index].string),
            )),
            TextButton(
                onPressed: () {
                  refetch!();
                },
                child: Text('Refresh'))
          ],
        ));
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
