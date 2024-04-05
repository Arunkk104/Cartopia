import 'package:arun_final_project/provider/auth_provider.dart';
import 'package:arun_final_project/provider/cart_provider.dart';
import 'package:arun_final_project/provider/user_update_provider.dart';
import 'package:arun_final_project/view/splas_scree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider<UserUpdate>(
          create: (context) {
            return UserUpdate();
          },
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Final Project',
        home: SplashScreen(),
      ),
    );
  }
}
