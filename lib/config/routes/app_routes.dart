import 'package:flutter/material.dart';
import 'package:procuts_task/features/auth/presentation/screens/splash_screen.dart';
import 'package:procuts_task/features/products/presentation/screens/products_screen.dart';

import 'package:procuts_task/features/tabBar/presentation/screen/tab_bar_screen.dart';
import '../../core/utils/app_strings.dart';

import '../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';

  static const String tabBarScreenRoute = '/TabBarScreen';

  static const String productsScreenRoute = '/ProductsScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const SplashScreen();
          },
        );

      case Routes.tabBarScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const TabBarScreen(),
        );

      case Routes.productsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ProductsScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }

  static String get currentRoute => routesStack.last;

  static void pushRouteToRoutesStack(String route) {
    routesStack.add(route);
    ServiceLocator.injectRoutesStackSingleton(routesStack);
  }

  static void popRouteFromRoutesStack() {
    routesStack.removeLast();
    ServiceLocator.injectRoutesStackSingleton(routesStack);
  }
}
