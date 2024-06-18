import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:login_screen/model/pre_def_data.dart';
import 'package:login_screen/service/router/app_router.dart';

class LoginViewModel extends ChangeNotifier {
  bool loginIsObscure = true;

  void toggleLoginPasswordVisibility() {
    loginIsObscure = !loginIsObscure;
    notifyListeners();
  }
}

class NewPasswordAlert extends StatelessWidget {
  const NewPasswordAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('New password is set'),
          content: const Text('Click ok to proceed'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

