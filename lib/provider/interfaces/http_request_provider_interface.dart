import 'package:dio/dio.dart';

abstract class HttpRequestProviderInterface {
  Dio get dio;
  Future<Map<String, String>> getToken();
}
