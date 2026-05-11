import 'package:docdocnasr66/features/auth/data/request_body.dart';
import 'package:docdocnasr66/features/auth/logic/cubit.dart';
import 'package:docdocnasr66/features/auth/logic/state.dart';
import 'package:docdocnasr66/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/txt_style.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_txt_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: ColorsManager.backgroundapp,
        body: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.responseModel.message)),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (state is AuthErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.em)));
            }
          },
          builder: (context, state) {
            return SafeArea(
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Image.asset(
                            //       "lib/core/assets/Container.png",
                            //       width: 21,
                            //       height: 25,
                            //     ),
                            //     const SizedBox(width: 6),
                            //     Image.asset(
                            //       "lib/core/assets/Heading 1.png",
                            //       width: 204,
                            //       height: 40,
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 30),

                            // TEXT
                            Text(
                              "Welcome back",
                              style: TxtStyle.size24w400black,
                            ),
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
                                Txtfield(
                                  secureTxt: false,
                                  hintText: "name@example.com",
                                  controller: emailController,
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Password",
                                    style: TxtStyle.size12w400black,
                                  ),
                                ),
                                Txtfield(
                                  hintText: "password",
                                  controller: passController,
                                  prefixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        isSecure = !isSecure;
                                        print("======= isSecure value = $isSecure");

                                      });
                                    },
                                    icon: Icon( isSecure
                                        ? Icons.visibility_off
                                        : Icons.visibility,)

                                  ),
                                  secureTxt: isSecure,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),

                            // Button
                            AppButton(
                              width: double.infinity,
                              txt: (state is AuthLoadingState)
                                  ? "Loading..."
                                  : "Log In",
                              onPress: () {
                                context.read<AuthCubit>().login(
                                  RequestBody(
                                    email: emailController.text,
                                    password: passController.text,
                                  ),
                                );
                              },
                            ),
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
                                  child: Text(
                                    "Sign up",
                                    style: TxtStyle.size14w800primary,
                                  ),
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
            );
          },
        ),
      ),
    );
  }
}
