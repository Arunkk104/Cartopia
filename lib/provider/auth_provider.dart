import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  bool tap = true;
  bool on = true;

  showRegisterPassword() {
    tap = !tap;
    notifyListeners();
  }

  showLoginPassword() {
    on = !on;
    notifyListeners();
  }
}
