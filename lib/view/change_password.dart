import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround3,
      appBar: AppBar(
        backgroundColor: AppColor.backGround3,
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Password',
                style: TextStyle(fontSize: 18, color: AppColor.backGround2),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Forgot Password?'))
                ],
              ),
              const SizedBox(height: 20),
              Text(
                ' New Password',
                style: TextStyle(fontSize: 18, color: AppColor.backGround2),
              ),
              const TextField(
                decoration: InputDecoration(),
              ),
              const SizedBox(height: 40),
              Text(
                'Confirm New Password',
                style: TextStyle(fontSize: 18, color: AppColor.backGround2),
              ),
              const TextField(
                decoration: InputDecoration(),
              ),
              const SizedBox(height: 40),
              CustomButton(text: 'update', tap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
