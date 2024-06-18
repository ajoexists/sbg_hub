import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/service/router/auth_guard.dart';

import 'package:login_screen/view/login_home.dart';
import 'package:login_screen/view/register_home.dart';
import 'package:login_screen/view/confirm_password.dart';
import 'package:login_screen/view/forgot_password.dart';
import 'package:login_screen/view/games_home.dart';
import 'package:login_screen/view/about_page.dart';
import 'package:login_screen/view/about_auth.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final bool authenticated;

  AppRouter(this.authenticated);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginHomeRoute.page, initial: true),
    AutoRoute(page: RegisterHomeRoute.page),
    AutoRoute(page: ConfirmPasswordRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: AboutAuthRoute.page),
    AutoRoute(page: GameHomeRoute.page),
    AutoRoute(
      page: AboutRoute.page,
      guards: [AuthGuard(authenticated)]
    ),
    AutoRoute(page: RouteViewWidget.page)
  ];
}

