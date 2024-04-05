import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/provider/auth_provider.dart';
import 'package:arun_final_project/services/authservice.dart';
import 'package:arun_final_project/view/register.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

 final TextEditingController email = TextEditingController();
 final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backGround2,
      appBar: AppBar(
        backgroundColor: AppColor.backGround2,
        title: const Text(
          'Log In',
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
                          hintText: 'Email Id',
                          prefixIcon: const Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: password,
                      obscureText: auth.on,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                            onPressed: () {
                              auth.showLoginPassword();
                            },
                            icon: Icon((auth.on
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text('Remember me')
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                        text: 'Log In',
                        tap: () {
                          AuthService()
                              .loginUser(email.text, password.text, context);
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New user?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return RegisterPage();
                                },
                              ));
                            },
                            child: Text(
                              'Register here',
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
