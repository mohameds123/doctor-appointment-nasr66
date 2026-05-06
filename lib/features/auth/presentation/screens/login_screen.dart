
import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/txt_style.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_txt_field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundapp,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  // هنا السر: بنجبر الـ Column ياخد طول الشاشة كحد أدنى
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // LOGO
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/core/assets/Container.png",
                            width: 21,
                            height: 25,
                          ),
                          const SizedBox(width: 6),
                          Image.asset(
                            "lib/core/assets/Heading 1.png",
                            width: 204,
                            height: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // TEXT
                      Text("Welcome back", style: TxtStyle.size24w400black),
                      const SizedBox(height: 8),
                      Text(
                        "Please enter your details to sign in.",
                        style: TxtStyle.size16w300black,
                      ),
                      const SizedBox(height: 20),

                      // Inputs
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email Address",
                              style: TxtStyle.size12w400black,
                            ),
                          ),
                          Txtfield(hintText: "name@example.com", ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Password", style: TxtStyle.size12w400black),
                          ),
                          Txtfield(hintText: "password",),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Button
                      AppButton(width: double.infinity, txt: "Log In",onPress: (){},),
                      const SizedBox(height: 15),

                      // Sign up Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) => const Signup()),
                              // );
                            },
                            child: Text("Sign up",
                                style: TxtStyle.size14w800primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}