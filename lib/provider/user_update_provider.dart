import 'dart:io';

import 'package:arun_final_project/data/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserUpdate extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final storage = FirebaseStorage.instance.ref();

  Future<void> uploadPhoto(File file, BuildContext context) async {
    /// path setting
    var photo = storage.child('user/$uid');

    /// function for upload image to path
    await photo.putFile(file).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Uploaded'),
              backgroundColor: AppColor.backGround3,
            ),
          ),
        );

    /// to get the link of the image in path
    await photo.getDownloadURL().then((value) async {
      await userCollection.doc(uid).update({'photo': value});
    });
  }

  ///
  Future<void> addPhoto(ImageSource source, BuildContext context) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      if (context.mounted) {
        await uploadPhoto(File(image.path), context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Photo Added'),
          backgroundColor: AppColor.backGround2,
        ));
      }
    }
  }

  Future<void> deletePhoto(BuildContext context) async {
    await storage.child('user/$uid').delete().whenComplete(() {
      userCollection.doc(uid).update({'photo': ''});
      Navigator.pop(context);
    });
  }

  Future<void> userUpdate(TextEditingController name,
      TextEditingController phone, TextEditingController dob) async {
    if (name.text.isNotEmpty && phone.text.isNotEmpty && dob.text.isNotEmpty) {
      await userCollection.doc(uid).update(
          {'username': name.text, 'phone': phone.text, 'dob': dob.text});
    } else if (name.text.isNotEmpty) {
      await userCollection.doc(uid).update({'username': name.text});
    } else if (phone.text.isNotEmpty) {
      await userCollection.doc(uid).update({'phone': phone.text});
    } else if (dob.text.isNotEmpty) {
      await userCollection.doc(uid).update({'dob': dob.text});
    }

    name.clear();
    phone.clear();
    dob.clear();
    notifyListeners();
  }
}
