import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/services/authservice.dart';
import 'package:arun_final_project/services/wishlist_service.dart';
import 'package:arun_final_project/view/List/image_list.dart';
import 'package:arun_final_project/view/account.dart';
import 'package:arun_final_project/view/product_page.dart';
import 'package:arun_final_project/view/whishlist.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'List/product_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

final  List<ProductList> allItems = [
    ProductList(
        image: ImageList.mobile, name: 'Iphone 15 pro max', price: '1200'),
    ProductList(image: ImageList.banana, name: 'banana', price: '100'),
    ProductList(image: ImageList.barby, name: 'barby doll', price: '200'),
    ProductList(image: ImageList.car, name: 'Car', price: '500'),
    ProductList(image: ImageList.domex, name: 'Domex', price: '80'),
    ProductList(image: ImageList.dragon, name: 'Dragon', price: '160'),
    ProductList(image: ImageList.earpode, name: 'Earpode', price: '300'),
    ProductList(image: ImageList.oil, name: 'Oil', price: '300'),
    ProductList(image: ImageList.santa, name: 'santa', price: '100'),
    ProductList(image: ImageList.tomato, name: 'tomato', price: '80'),
    ProductList(image: ImageList.watch, name: 'Watch', price: '180'),
    ProductList(image: ImageList.headphone, name: 'Headphone', price: '260'),
  ];
 final List<ProductList> electronics = [
    ProductList(
        image: ImageList.mobile, name: 'Iphone 15 pro max', price: '1200'),
    ProductList(image: ImageList.headphone, name: 'Headphone', price: '260'),
    ProductList(image: ImageList.earpode, name: 'Earpode', price: '300'),
    ProductList(image: ImageList.watch, name: 'Watch', price: '180'),
  ];

 final List<ProductList> toys = [
    ProductList(image: ImageList.car, name: 'Car', price: '500'),
    ProductList(image: ImageList.barby, name: 'barby doll', price: '200'),
    ProductList(image: ImageList.dragon, name: 'Dragon', price: '160'),
    ProductList(image: ImageList.santa, name: 'santa', price: '100'),
  ];
 final List<ProductList> grocery = [
    ProductList(image: ImageList.banana, name: 'banana', price: '100'),
    ProductList(image: ImageList.domex, name: 'Domex', price: '80'),
    ProductList(image: ImageList.oil, name: 'Oil', price: '300'),
    ProductList(image: ImageList.tomato, name: 'tomato', price: '80'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const WishList();
                    },
                  ));
                  // Helper.showSnackbar(context, 'welcome', AppColor.backGround2);
                },
                icon: const Icon(Icons.favorite_border_outlined))
          ],
        ),
        drawer: Drawer(
          width: double.infinity,
          backgroundColor: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 30),
              ListTile(
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Account()));},
                leading: CircleAvatar(
                  backgroundColor: AppColor.backGround3,
                  child: Icon(
                    Icons.settings,
                    color: AppColor.backGround2,
                  ),
                ),
                title: const Text('Settings'),
                trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.backGround3,
                  child: Icon(
                    Icons.star_half_outlined,
                    color: AppColor.backGround2,
                  ),
                ),
                title: const Text('Rate the app '),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.backGround3,
                  child: Icon(
                    Icons.share,
                    color: AppColor.backGround2,
                  ),
                ),
                title: const Text('Share the app '),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.backGround3,
                  child: Icon(
                    Icons.help,
                    color: AppColor.backGround2,
                  ),
                ),
                title: const Text('FAQ'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.backGround3,
                  child: Icon(
                    Icons.info,
                    color: AppColor.backGround2,
                  ),
                ),
                title: const Text('About us'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomButton(
                    text: 'LogOut',
                    tap: () {
                      AuthService().logoutUser(context);
                    }),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset('asset/image/ads.png'),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                  labelStyle:
                      TextStyle(color: AppColor.backGround2, fontSize: 15),
                  dividerHeight: 0,
                  isScrollable: true,
                  indicatorColor: AppColor.backGround2,
                  tabs: const [
                    Text('All'),
                    Text('Electronics'),
                    Text('Toys'),
                    Text('Grocery'),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.65,
                      crossAxisCount: 2,
                    ),
                    itemCount: allItems.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductPage(product: allItems[index]);
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(allItems[index].image),
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
                                          WishlistService().addToWishlist(
                                              context, allItems[index]);
                                        },
                                        icon: const Icon(
                                            Icons.favorite_border_outlined)),
                                  ),
                                )
                              ],
                            ),
                            Text(allItems[index].name),
                            Text(allItems[index].price)
                          ],
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.65,
                      crossAxisCount: 2,
                    ),
                    itemCount: electronics.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductPage(product: electronics[index]);
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(electronics[index].image),
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
                                          WishlistService().addToWishlist(
                                              context, electronics[index]);
                                        },
                                        icon: const Icon(
                                            Icons.favorite_border_outlined)),
                                  ),
                                )
                              ],
                            ),
                            Text(electronics[index].name),
                            Text(electronics[index].price)
                          ],
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.65,
                      crossAxisCount: 2,
                    ),
                    itemCount: toys.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductPage(product: toys[index]);
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(toys[index].image),
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
                                          WishlistService().addToWishlist(
                                              context, toys[index]);
                                        },
                                        icon: const Icon(
                                            Icons.favorite_border_outlined)),
                                  ),
                                )
                              ],
                            ),
                            Text(toys[index].name),
                            Text(toys[index].price)
                          ],
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.65,
                      crossAxisCount: 2,
                    ),
                    itemCount: grocery.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductPage(product: grocery[index]);
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(grocery[index].image),
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
                                          WishlistService().addToWishlist(
                                              context, grocery[index]);
                                        },
                                        icon: const Icon(
                                            Icons.favorite_border_outlined)),
                                  ),
                                )
                              ],
                            ),
                            Text(grocery[index].name),
                            Text(grocery[index].price)
                          ],
                        ),
                      );
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
