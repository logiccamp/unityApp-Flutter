import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unitycargo/app/appconatiner.dart';
import 'package:unitycargo/app/createaccount.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/bll/password_logic.dart';
import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/utils/colors.dart';
import '../bll/login_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/response_data.dart';

class ResetPasswordMain extends StatefulWidget {
  const ResetPasswordMain({Key? key}) : super(key: key);
  @override
  _ResetPasswordMainState createState() => _ResetPasswordMainState();
}

class _ResetPasswordMainState extends State<ResetPasswordMain> {
  bool isLoading = false;
  AppAuthentication appAuthentication = AppAuthentication();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    isLoading = false;
    // TODO: implement initState
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/images/background_image2.png',
                    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .15,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'FORGOT PASSWORD',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                  component(
                                    Icons.email_outlined,
                                    'Email...',
                                    false,
                                    true,
                                    emailController,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Login to you account',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              // Fluttertoast.showToast(
                                              //   msg:
                                              //   'Forgotten password! button pressed',
                                              // );
                                              appAuthentication
                                                  .navigatePageReal(context,
                                                      const LoginScreen());
                                            },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.width * .3),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      final isValid = await appAuthentication
                                          .verifyForgotPassword(
                                        emailController.text,
                                      );

                                      if (isValid != "valid") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(isValid),
                                            backgroundColor:
                                                Colors.red.withOpacity(0.6),
                                          ),
                                        );

                                        return;
                                      }
                                      PasswordLogic passwordLogic =
                                          PasswordLogic();

                                      ResponseData forgotPassword =
                                          await passwordLogic.resetPassword(
                                              emailController.text, "", "", "");

                                      if (forgotPassword.success == true) {
                                        await appAuthentication
                                            .removeTokenVariable(
                                                "password_reset_email");
                                        appAuthentication.navigatePageReal(
                                            context, const LoginScreen());
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text(forgotPassword.message),
                                            backgroundColor:
                                                Colors.red.withOpacity(0.6),
                                          ),
                                        );
                                      }
                                      setState(() => isLoading = false);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .05,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isLoading
                                            ? Colors.grey.withOpacity(.1)
                                            : Colors.black.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        isLoading ? 'Processing...' : 'Sign-In',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
