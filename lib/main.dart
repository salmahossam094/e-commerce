import 'package:bloc/bloc.dart';
import 'package:e_commerce/app.dart';
import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  var user = CacheHelper.getData("User");
  String route;
  if (user == null) {
    route = Routes.loginRoute;
  } else {
    route = Routes.homeRoute;
  }
  runApp(MyApp(
    route: route,
  ));
}
