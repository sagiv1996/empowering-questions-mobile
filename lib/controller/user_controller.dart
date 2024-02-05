import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  static User? user = FirebaseAuth.instance.currentUser;


  static Future<User?>? loginByAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
