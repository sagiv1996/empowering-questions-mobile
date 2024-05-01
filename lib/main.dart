import 'package:empowering_questions_mobile/api/question.dart';
import 'package:empowering_questions_mobile/env/env.dart';
import 'package:empowering_questions_mobile/firebase_options.dart';
import 'package:empowering_questions_mobile/provider/chat_register_provider.dart';
import 'package:empowering_questions_mobile/provider/questions_provider.dart';
import 'package:empowering_questions_mobile/view/pages/home_page.dart';
import 'package:empowering_questions_mobile/view/pages/question_page.dart';
import 'package:empowering_questions_mobile/view/pages/register_page.dart';
import 'package:empowering_questions_mobile/view/pages/setting_page.dart';
import 'package:empowering_questions_mobile/view/pages/home_page.dart';
import 'package:empowering_questions_mobile/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:dio/dio.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    final id = message.data['_id'];
    routerKey.currentContext?.push('/question/$id');
  });
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: routerKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
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
      path: '/register-page',
      builder: (context, state) => const RegisterPage(),
    ),
    // GoRoute(
    //   path: '/question/:id',
    //   builder: (context, state) {
    //     final String questionId = state.pathParameters['id']!;
    //     return QuestionPage(questionId: questionId);
    //   },
    //   redirect: (context, state) {
    //     final String? questionId = state.pathParameters['id'];
    //     if (questionId == null) {
    //       return "/";
    //     }
    //     return '/question/$questionId';
    //   },
    // ),
    // GoRoute(
    //   path: '/setting-page',
    //   builder: (context, state) => SettingPage(),
    // )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatRegisterProvider()),
          ChangeNotifierProvider(create: (_) => QuestionsProvider()),
        ],
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
          theme: FlexThemeData.light(scheme: FlexScheme.indigoM3),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.indigoM3,
          ),
        ));
  }
}
