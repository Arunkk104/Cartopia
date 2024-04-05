import 'package:cloud_firestore/cloud_firestore.dart';



class CloudService {
  final cloud = FirebaseFirestore.instance.collection('user').snapshots();

  addWishlist(
      String image, String name, String price
      ){

  }




}