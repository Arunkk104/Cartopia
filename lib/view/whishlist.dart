import 'package:arun_final_project/services/wishlist_service.dart';
import 'package:arun_final_project/view/product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'List/product_list.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Wishlist'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('wishlist')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Image.asset('asset/image/empty_wishlist.jpg'),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ProductPage(
                              product: ProductList(
                                  image: data['image'],
                                  name: data['name'],
                                  price: data['price']));
                        },
                      ));
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(data['image']),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: IconButton(
                                    onPressed: () {
                                      WishlistService()
                                          .removeFromWishlist(data['uid']);
                                    },
                                    icon: const Icon(
                                        Icons.favorite_border_outlined)),
                              ),
                            )
                          ],
                        ),
                        Text(data['name']),
                        Text(data['price'])
                      ],
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
