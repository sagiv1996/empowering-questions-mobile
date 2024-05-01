import 'package:empowering_questions_mobile/env/env.dart';
import 'package:empowering_questions_mobile/provider/base_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

abstract class HttpRequestProvider extends BaseProvider {
  Dio dio = Dio(BaseOptions(
    baseUrl: Env.backendUrl,
  ));

  Future<Map<String, String>> getToken() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    return {"Authorization": "Bearer $token"};
  }
}
