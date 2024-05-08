import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/provider/http_request_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/user_provider_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserProvider extends HttpRequestProvider
    implements UserProviderInterface {
  User? _user;
  @override
  User? get user => _user;
  @override
  void setUser(User user) {
    _user = user;
  }

  @override
  Future<void> createUser(
      {required FrequencyOptions frequency,
      required List<CategoryOptions> categories,
      required GenderOptions gender}) async {
    await UserController.loginByAnonymously();
    final String? fcm = await FirebaseMessaging.instance.getToken();
    setIsLoading(true);
    dio.options.headers = await getToken();
    final client = RestUser(dio);
    Map<String, dynamic> map = {
      "fcm": fcm,
      "frequency": frequency.name,
      "gender": gender.name,
      "categories": categories.map((category) => category.name).toList(),
    };
    User user = await client.createUser(map);
    setUser(user);
    setIsLoading(false);
  }

  @override
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
      setUser(user);
      setIsLoading(false);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> getUser() async {
    try {
      setIsLoading(true);
      dio.options.headers = await getToken();
      final client = RestUser(dio);
      User user = await client.getUser();
      setUser(user);
      setIsLoading(false);
      return true;
    } catch (e) {
      return false;
    }
  }
}
