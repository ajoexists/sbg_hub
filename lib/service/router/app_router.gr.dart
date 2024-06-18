// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutAuthRoute.name: (routeData) {
      final args = routeData.argsAs<AboutAuthRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AboutAuthPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    ConfirmPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmPasswordPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    GameHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameHomePage(),
      );
    },
    LoginHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginHomePage(),
      );
    },
    RegisterHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterHomePage(),
      );
    },
  };
}

/// generated route for
/// [AboutAuthPage]
class AboutAuthRoute extends PageRouteInfo<AboutAuthRouteArgs> {
  AboutAuthRoute({
    Key? key,
    required dynamic Function(bool?) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          AboutAuthRoute.name,
          args: AboutAuthRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'AboutAuthRoute';

  static const PageInfo<AboutAuthRouteArgs> page =
      PageInfo<AboutAuthRouteArgs>(name);
}

class AboutAuthRouteArgs {
  const AboutAuthRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'AboutAuthRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmPasswordPage]
class ConfirmPasswordRoute extends PageRouteInfo<void> {
  const ConfirmPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GameHomePage]
class GameHomeRoute extends PageRouteInfo<void> {
  const GameHomeRoute({List<PageRouteInfo>? children})
      : super(
          GameHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginHomePage]
class LoginHomeRoute extends PageRouteInfo<void> {
  const LoginHomeRoute({List<PageRouteInfo>? children})
      : super(
          LoginHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PageViewWidget]
class RouteViewWidget extends PageRouteInfo<void> {
  const RouteViewWidget({List<PageRouteInfo>? children})
      : super(
          RouteViewWidget.name,
          initialChildren: children,
        );

  static const String name = 'RouteViewWidget';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterHomePage]
class RegisterHomeRoute extends PageRouteInfo<void> {
  const RegisterHomeRoute({List<PageRouteInfo>? children})
      : super(
          RegisterHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
