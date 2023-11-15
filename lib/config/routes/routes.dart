import 'package:e_commerce/core/utils/components.dart';
import 'package:e_commerce/features/cart/presentation/pages/cart.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/presentation/pages/cateDetails.dart';
import 'package:e_commerce/features/home/presentation/pages/home.dart';
import 'package:e_commerce/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerce/features/sign_up/presentation/pages/sign_up.dart';
import 'package:e_commerce/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/presentation/pages/login.dart';
import '../../features/sign_up/data/data_sources/remote_data_source.dart';
import '../../features/sign_up/presentation/manager/cubit.dart';

class Routes {
  static const String loginRoute = 'login';
  static const String signUpRoute = 'signUp';
  static const String homeRoute = 'home';
  static const String splash = '/';
  static const String catDetails = 'CatDetails';
  static const String proDetails = "ProDetails";
  static const String cart = 'Cart';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => SignUpCubit(RemoteDataSource()),
              child: const SignUpScreen()),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.homeRoute:
        // var loginEntity =routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.catDetails:
        String cat = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => CatDetails(cat),
        );
      case Routes.proDetails:
        DataDetailsEntity entity = routeSettings.arguments as DataDetailsEntity;
        return MaterialPageRoute(
          builder: (context) => ProductDetails(
            entity: entity,
          ),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefinedPage(),
        );
    }
  }
}
