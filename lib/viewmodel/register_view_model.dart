import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/service/router/app_router.dart';

import 'package:login_screen/view/login_home.dart';

class RegisterViewModel extends ChangeNotifier {
  bool registerIsObscure = true;
  bool confirmIsObscure = true;

  void registerAlert(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Registered Successfully'),
        content: const Text('Click OK to proceed'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).push(const LoginHomeRoute());
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void toggleRegisterPasswordVisibility() {
    registerIsObscure = !registerIsObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    confirmIsObscure = !confirmIsObscure;
    notifyListeners();
  }

  void loginHere(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => const LoginHomePage()
      ),
    );
  }

}