import 'package:flutter/material.dart';
import 'package:ibrat_informatika/presentation/pages/home_page/home_page.dart';
import 'package:ibrat_informatika/presentation/pages/profile_page/profile_page.dart';
import 'package:ibrat_informatika/presentation/pages/registration_page/registration_page.dart';
import 'package:ibrat_informatika/presentation/pages/result_page/result_page.dart';

sealed class AppRoutes {
  static const home = "/home";
  static const profile = "/profile";
  static const registration = "/registration";
  static const resultPage = "/resultPage";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomePage(),
    registration: (context) => const SignUpScreen(),
    profile: (context) => const ProfilePage(),
    resultPage: (context) => const ResultPage(),
  };
}
