import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseMessagingController {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> handlerPermission() =>
      _firebaseMessaging.requestPermission();

  static Future<void> initNotifications() async {
    final fcMToken = await _firebaseMessaging.getToken();
  }
}
