import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/question.graphql.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        if (result.isLoading) Text("Loading...");
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(child: Text(result.parsedData?.findRandom?[0].string ?? "TT")),
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
