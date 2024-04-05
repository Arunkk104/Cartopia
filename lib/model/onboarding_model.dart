class OnBoarding {
  String category;
  String image;
  String description;

  OnBoarding(
      {required this.category, required this.description, required this.image});
}

List<OnBoarding> onBoardingList = [
  OnBoarding(
      category: 'Electronics',
      description:
          'Online Electronics Store. Browse through an electronics store for the latest additions to its goods category, as these devices make your lives less complicated.',
      image: 'asset/image/onBoarding1.png'),
  OnBoarding(
      category: 'Toys',
      description:
          'Toys For Boys & Girls: Shop for Gifts For Kids online at best prices in India. Choose from a wide range of Toys for Boys & Girls at Cartopia',
      image: 'asset/image/onBoarding2.png'),
  OnBoarding(
      category: 'Grocery',
      description:
          'Whether you work from home or office or other workplaces, daily grocery items are a requisite for everybody.',
      image: 'asset/image/onBoarding3.png')
];
