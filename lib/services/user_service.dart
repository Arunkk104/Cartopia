import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserService {
  final cloud = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  addUser(
    String email,
    String password,
      String name,
  ) async {

    await cloud.collection('user').doc(uid).set({
      'email': email,
      'password': password,
      'uid': uid,
      'username': name,
      'phone': '',
      'photo': '',
      'dob':''
    });
  }
}
