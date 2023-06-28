import 'package:flutter/material.dart';
import 'package:tut_app/presentation/forget_password/forget_password_screen.dart';
import 'package:tut_app/presentation/home/home_screen.dart';
import 'package:tut_app/presentation/login/login_screen.dart';
import 'package:tut_app/presentation/register/register_screen.dart';
import 'package:tut_app/presentation/splash/splashScreen.dart';

class Routes{
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgetPasswordScreen = '/forgetPassword';
  static const String mainScreen = '/main';
  static const String storeDetailsScreen = '/storeDetails';
}

class RoutesGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_)=>const ForgetPasswordScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_)=>const MainScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>const Scaffold());
  }
}