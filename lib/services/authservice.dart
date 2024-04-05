import 'package:arun_final_project/services/user_service.dart';
import 'package:arun_final_project/view/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/log_in.dart';

class AuthService {
  final fireAuth = FirebaseAuth.instance;

  createUser(String username, String email, String password,
      BuildContext context) async {
    try {
      var user = await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserService().addUser(email, password, username);
      var currentUser = user.user;
      if (currentUser != null && context.mounted) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return BottomNav();
          },
        ), (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The account already exists for that email')));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  loginUser(String email, String password, BuildContext context) async {
    try {
      var user = await fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (fireAuth.currentUser != null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return BottomNav();
          },
        ), (route) => false);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.code);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        print(e.code);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong password provided for that user.')));
      } else if (e.code == 'invalid-credential') {
        print(e.code);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Invalid-credential',
              style: TextStyle(color: Colors.white),
            )));
      } else {
        print(e.code);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Wrong password provided for that user.',
              style: TextStyle(color: Colors.white),
            )));
      }
    }
  }

  logoutUser(BuildContext context) async {
    await fireAuth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ),
        (route) => false);
  }
}
