import 'dart:async';

import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'core/utils/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user = CacheHelper.getData("User");
    String route=Routes.splash;
    if (user == null) {

      route = Routes.loginRoute;
    } else {

      route = Routes.homeRoute;
    }
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.splash);
  }
}
