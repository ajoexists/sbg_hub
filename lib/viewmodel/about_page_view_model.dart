import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/service/router/app_router.dart';

class AboutPageModel extends ChangeNotifier {

  void exitAlert(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Do you want to exit?'),
        content: const Text('Click OK to exit'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).push(const GameHomeRoute());
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

}