import 'package:arun_final_project/view/List/product_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class WishlistService {
  String uid = randomAlphaNumeric(10);
  static String user = FirebaseAuth.instance.currentUser!.uid;
  final collection = FirebaseFirestore.instance
      .collection('user')
      .doc(user)
      .collection('wishlist');

  Future<bool> added(ProductList product) async {
    return await collection
        .where('name', isEqualTo: product.name)
        .get()
        .then((value) => value.size > 0 ? true : false);
  }

  Future<void> addToWishlist(BuildContext context, ProductList product) async {
    if (await added(product)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Already in cart'),duration: Duration(milliseconds: 200),));
    } else {
      await collection.doc(uid).set({
        'image': product.image,
        'name': product.name,
        'uid': uid,
        'category': product.category ?? "",
        'price': product.price
      });
    }
  }

  Future<void> removeFromWishlist( String uid) async {
    await collection.doc(uid).delete();
  }
}
