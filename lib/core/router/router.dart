import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/home_page.dart';
import '../../feature/shared/widget/basic.dart' show ErrorPage;

class MyRouter {
  static final _appShellKey = GlobalKey<NavigatorState>(debugLabel: 'app');
  static final _homeShellKey = GlobalKey<NavigatorState>(debugLabel: 'home');

  MyRouter._();

  static final config = GoRouter(
    initialLocation: '/',
    navigatorKey: _appShellKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return null;
    },
    errorBuilder: (context, state) {
      return ErrorPage(subtitle: state.error?.message);
    },
    routes: [
      Route('home', '/', (c, s) => HomePage())
      // Route(MyRoute.home, MyPath.home, (c, s) => HomePage(nav: s.uri.queryParameters['nav']), routes: [
      //   Route(MyRoute.favorite, MyPath.favorite, (c, s) => const FavoritePage()),
      //   Route(MyRoute.coupon, MyPath.coupon, (c, s) => const CouponPage()),
      //   Route(MyRoute.order, MyPath.order, (c, s) => const OrderPage()),
      // ]),

      // ShellRoute(navigatorKey: _homeShellKey, builder: (c, s, page) => HomePage(nav: page), routes: [
      //   Route(MyRoute.food, MyPath.food, (c, s) =>  const FoodPage()),
      //   Route(MyRoute.restaurant, MyPath.restaurant, (c, s) => const RestaurantPage()),
      //   Route(MyRoute.account, MyPath.account, (c, s) => const AccountPage(), routes: [
      //     Route(MyRoute.favorite, MyPath.favorite, (c, s) => const FavoritePage(),parentNavigatorKey: _appShellKey),
      //     Route(MyRoute.coupon, MyPath.coupon, (c, s) => const CouponPage(), parentNavigatorKey: _appShellKey),
      //     Route(MyRoute.order, MyPath.order, (c, s) => const OrderPage(), parentNavigatorKey: _appShellKey),
      //   ]),
      // ]),

      // Route(MyRoute.auth, MyPath.auth, (c, s) => const AuthPage(), routes: [
      //   Route(MyRoute.verify, MyPath.verify, (c, s) => const OtpPage()),
      // ]),
      // Route(MyRoute.update, MyPath.update, (c, s) => const UpdatePage()),
      // Route(MyRoute.maintenance, MyPath.maintenance, (c, s) => const MaintenancePage()),
    ],
  );
}

class Route extends GoRoute {
  Route(String name, String path, Widget Function(BuildContext c, GoRouterState s)? builder,
      {super.routes, super.redirect, super.pageBuilder, super.parentNavigatorKey, super.onExit})
      : super(name: name, path: path, builder: builder);
}
