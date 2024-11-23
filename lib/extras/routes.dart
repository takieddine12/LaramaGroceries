


import 'package:get/get.dart';
import 'package:groceries/views/home_screen.dart';
import 'package:groceries/views/intro_screen.dart';
import 'package:groceries/views/login_screen.dart';
import 'package:groceries/views/password_screen.dart';
import 'package:groceries/views/register_screen.dart';
import 'package:groceries/views/splash_screen.dart';

class Routes {

  static final String splash = "/splash";
  static final String intro = "/intro";
  static final String login = "/login";
  static final String register = "/register";
  static final String password = "/password";
  static final String home = "/home";


  static List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: intro, page: () => const IntroScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: password, page: () => const PasswordScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];

}