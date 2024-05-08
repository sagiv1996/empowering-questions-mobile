import 'package:empowering_questions_mobile/api/user.dart';

abstract class UserProviderInterface {
  User? get user;
  void setUser(User user);
  Future<void> createUser(
      {required FrequencyOptions frequency,
      required List<CategoryOptions> categories,
      required GenderOptions gender});

  Future<bool> updateUser(
      {required FrequencyOptions frequency,
      required List<CategoryOptions> categories});

  Future<bool> getUser();
}
