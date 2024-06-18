import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/service/router/app_router.dart';

class ConfirmPassViewModel extends ChangeNotifier {

  bool registerIsObscure = true;
  bool confirmIsObscure = true;

  void toggleRegisterPasswordVisibility() {
    registerIsObscure = !registerIsObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    confirmIsObscure = !confirmIsObscure;
    notifyListeners();
  }

  void confirmPasswordAlert(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('New password is set'),
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
}