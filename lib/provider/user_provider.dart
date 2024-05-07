import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/provider/http_request_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserProvider extends HttpRequestProvider {
  User? _user;
  User? get user => _user;

  Future<void> createUser(Map<String, dynamic> map) async {
    await UserController.loginByAnonymously();
    final String? fcm = await FirebaseMessaging.instance.getToken();
    setIsLoading(true);
    dio.options.headers = await getToken();
    final client = RestUser(dio);
    map['fcm'] = fcm;
    User user = await client.createUser(map);
    _user = user;
    setIsLoading(false);
  }

  Future<bool> updateUser(
      {required FrequencyOptions frequency,
      required List<CategoryOptions> categories}) async {
    try {
      setIsLoading(true);
      dio.options.headers = await getToken();
      final client = RestUser(dio);
      Map<String, dynamic> map = {
        "frequency": frequency.name,
        "categories": categories.map((category) => category.name).toList()
      };
      User user = await client.updateUser(map);
      _user = user;
      setIsLoading(false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getUser() async {
    try {
      setIsLoading(true);
      dio.options.headers = await getToken();
      final client = RestUser(dio);
      User user = await client.getUser();
      _user = user;
      setIsLoading(false);
      return true;
    } catch (e) {
      return false;
    }
  }
}
