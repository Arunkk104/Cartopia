import 'package:arun_final_project/provider/auth_provider.dart';
import 'package:arun_final_project/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/color.dart';
import '../widget/custom_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

 final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backGround2,
      appBar: AppBar(
        backgroundColor: AppColor.backGround2,
        title: const Text(
          'Register',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Name',
                          prefixIcon: const Icon(Icons.person_2_outlined)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: password,
                      obscureText: auth.tap,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              onPressed: () {
                                auth.showRegisterPassword();
                              },
                              icon: Icon(auth.tap
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility))),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      controller: confirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Confirm password',
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                    ),
                    const SizedBox(height: 200),
                    CustomButton(
                        text: 'Register',
                        tap: () {
                          AuthService().createUser(
                              name.text, email.text, password.text, context);
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already user?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login here',
                              style: TextStyle(color: AppColor.backGround2),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
