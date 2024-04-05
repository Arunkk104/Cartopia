import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/view/account.dart';
import 'package:arun_final_project/view/cart_page.dart';
import 'package:arun_final_project/view/home_page.dart';
import 'package:arun_final_project/view/whishlist.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> currentPage = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  final pages = [HomePage(), const WishList(), const CartPage(), const Account()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, index, child) {
        return Scaffold(
          body: pages[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:index ,
              onTap: (value){
              currentPage.value=value;
              },
              type: BottomNavigationBarType.fixed,
              fixedColor: AppColor.backGround2,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined),
                    label: 'wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: 'Account'),
              ]),
        );
      },
    );
  }
}
