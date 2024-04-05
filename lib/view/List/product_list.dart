class ProductList {
  final String? uid;
  final String image;
  int? count;
  final String name;
  final String price;
  String? category;
  ProductList(
      {required this.image,
      required this.name,
      required this.price,
      this.uid,
      this.category,
      this.count = 1});
}
