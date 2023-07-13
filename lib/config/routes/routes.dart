import 'package:e_commerce/core/utils/components.dart';
import 'package:e_commerce/features/home/presentation/pages/home.dart';
import 'package:e_commerce/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/domain/entities/LoginEntity.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/sign_up/data/data_sources/remote_data_source.dart';
import '../../features/sign_up/presentation/manager/cubit.dart';

class Routes {
  static const String loginRoute = '/';
  static const String signUpRoute = 'signUp';
  static const String homeRoute = 'home';
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
        var loginEntity =routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(loginEntity),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefinedPage(),
        );
    }
  }
}
