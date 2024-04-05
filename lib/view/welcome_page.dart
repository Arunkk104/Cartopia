import 'package:arun_final_project/view/log_in.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../data/color.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/logo.png'),
            const Text(
              'Cartopia',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 10),
              const Text(
                  'Get your products on a greate deal. Log in or Register to continue shopping'),
              const SizedBox(height: 50),
              CustomButton(text: 'Log In', tap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                  return LogIn();
                },), (route) => false);
              }),
              Center(child: TextButton(onPressed: (){}, child: Text('Register',style: TextStyle(color: AppColor.backGround2,fontSize: 18),)))
            ],
          ),
        ),
      ),
    );
  }
}
