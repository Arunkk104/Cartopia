import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/services/cart_service.dart';
import 'package:arun_final_project/view/List/product_list.dart';
import 'package:arun_final_project/view/cart_page.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final ProductList product;
  ProductPage({super.key, required this.product});

 final List colors = [
    Colors.brown,
    Colors.black,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CartPage();
                  },
                ));
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(product.image), fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Icon(Icons.favorite_border_outlined),
                Text(
                  product.price,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text('4.6(15k Reviews)')
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                'The 48MP Main camera is more advanced than ever, capturing super‑high‑resolution photos with a new level of detail and colour.'),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Color',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colors[index]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    CartService().addToCart(context, product);
                  },
                  height: 45,
                  minWidth: 150,
                  color: AppColor.backGround3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.shopping_cart_outlined)
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(child: CustomButton(text: 'Buy Now', tap: () {}))
              ],
            )
          ],
        ),
      ),
    );
  }
}
