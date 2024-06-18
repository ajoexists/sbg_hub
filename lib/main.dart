import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:login_screen/service/router/app_router.dart';

import 'package:login_screen/viewmodel/login_view_model.dart';
import 'package:login_screen/viewmodel/register_view_model.dart';
import 'package:login_screen/viewmodel/confirm_pass_view_model.dart';
import 'package:login_screen/viewmodel/about_auth_view_model.dart';
import 'package:login_screen/viewmodel/about_page_view_model.dart';
import 'package:login_screen/viewmodel/forgot_pass_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => ConfirmPassViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPassViewModel()),
        ChangeNotifierProvider(create: (_) => AuthPageModel()),
        ChangeNotifierProvider(create: (_) => AboutPageModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter(false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
