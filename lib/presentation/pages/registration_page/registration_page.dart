import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrat_informatika/bloc/auth/auth_bloc.dart';
import 'package:ibrat_informatika/core/constants/colors.dart';
import 'package:ibrat_informatika/core/routes/app_routes.dart';
import 'package:ibrat_informatika/data/services/local_data.dart';
import 'package:ibrat_informatika/presentation/pages/home_page/home_page.dart';

import 'components/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().stream.listen((event) {
      if (event is AuthSuccessState && mounted) {
        Navigator.popAndPushNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(controller: nameController, title: "User Name"),
                CustomTextField(controller: emailController, title: "Email"),
                CustomTextField(
                    controller: passwordController, title: "Password"),
                SizedBox(
                  height: 70,
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(RegisterUser(
                          email: emailController.text,
                          password: passwordController.text,
                          username: nameController.text));
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppColors.primary,
                        ),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
}
