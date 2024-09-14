// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userAuth = FirebaseAuth.instance;

  // account creation logic
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await userAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // login logic
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await userAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // logic for sending the mail
  Future<void> sendVerifyEmail() async {
    try {
      await userAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  // this is used for verifying the email for the current user
  Future<bool> isEmailVerified() async {
    User? user = userAuth.currentUser;
    if (user != null) {
      await user.reload();
      return user.emailVerified;
    }
    return false;
  }
}
