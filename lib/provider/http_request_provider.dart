import 'package:empowering_questions_mobile/env/env.dart';
import 'package:empowering_questions_mobile/provider/base_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/http_request_provider_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

abstract class HttpRequestProvider extends BaseProvider
    implements HttpRequestProviderInterface {
  @override
  Dio dio = Dio(BaseOptions(
    baseUrl: Env.backendUrl,
  ));

  @override
  Future<Map<String, String>> getToken() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    return {"Authorization": "Bearer $token"};
  }
}
