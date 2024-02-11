import 'package:empowering_questions_mobile/view/pages/download_page.dart';
import 'package:empowering_questions_mobile/env/env.dart';
import 'package:empowering_questions_mobile/firebase_options.dart';
import 'package:empowering_questions_mobile/view/pages/home_page.dart';
import 'package:empowering_questions_mobile/register_page/register_page.dart';
import 'package:empowering_questions_mobile/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      redirect: (context, state) {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          return '/welcome-page';
        }
        return '/';
      },
    ),
    GoRoute(
      path: '/welcome-page',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(path: '/download', builder: (context, state) => const DownloadPage(),)
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      Env.graphqlUrl,
    );
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    return UpgradeAlert(
      child: GraphQLProvider(
          client: client,
          child: MaterialApp.router(
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('he', 'IL')],
            locale: const Locale('he', 'IL'),
            routerConfig: router,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          )),
    );
  }
}
