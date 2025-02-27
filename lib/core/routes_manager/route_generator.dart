import 'package:flutter/material.dart';

import '../../features/app_layout/presentation/app_layout.dart';
import '../../features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import '../../features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/products_screen/presentation/screens/products_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const AppLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
