import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/services/cart_service.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('cart')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Image.asset('asset/image/empty_cart.jpg'),
            );
          } else if (snapshot.hasData) {
            double total = 0.0;
            var data = snapshot.data!.docs;
            for (var snap in data) {
              total = total + (snap['count'] * int.parse(snap['price']));
            }
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text('Cart Page'),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];

                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                    AssetImage(data['image']),
                                                fit: BoxFit.contain)),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              CartService().increaseCount(
                                                  data['uid'], data['count']);
                                            },
                                            icon: const Icon(Icons.add),
                                            color: AppColor.backGround2,
                                          ),
                                          Text(data['count'].toString()),
                                          IconButton(
                                            onPressed: () {
                                              CartService().decreaseCount(
                                                  data['uid'], data['count']);
                                            },
                                            icon: const Icon(Icons.remove),
                                            color: AppColor.backGround2,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text('\$${data['price']}')
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      CartService().removeCart(data['uid']);
                                    },
                                    icon: const Icon(
                                        Icons.delete_outline_outlined))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 50,
                        child: Text(
                          'Total = $total',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomButton(
                        text: 'Buy Now',
                        tap: () {},
                      ),
                    ],
                  ),
                ));
          }
          return Container();
        },
      ),
      bottomNavigationBar: const SizedBox(height: 50),
    );
  }
}
