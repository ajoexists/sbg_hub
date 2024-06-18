import 'package:auto_route/auto_route.dart';
import 'package:login_screen/service/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final bool authenticated;

  AuthGuard(this.authenticated);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authenticated) {
      resolver.next(true);
    }
    else {
      router.push(AboutAuthRoute(onResult: (result) {
        if (result == true) {
          resolver.next(true);
        } else {
          resolver.next(false);
        }
      }));
    }
  }
}