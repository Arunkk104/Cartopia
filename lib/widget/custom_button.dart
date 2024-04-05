import 'package:flutter/material.dart';

import '../data/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback tap;

  const CustomButton({
    required this.text,
    required this.tap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: tap,
      color: AppColor.backGround2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      height: 45,
      minWidth: double.infinity,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
