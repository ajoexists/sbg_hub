import 'package:flutter/material.dart';

class AuthPageModel extends ChangeNotifier {
  bool loginIsObscure = true;


  void toggleLoginPasswordVisibility() {
    loginIsObscure = !loginIsObscure;
    notifyListeners();
  }
}

