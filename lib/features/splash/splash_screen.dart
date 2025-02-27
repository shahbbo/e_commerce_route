import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/helpers/local/cache_helper.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      var token = CacheHelper.getData(key: 'token');
      if (token == null) {
        Navigator.pushReplacementNamed(context, Routes.signInRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      }
    });
    return Scaffold(
        body: Image.asset(
      PngAssets.splashScreen,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
