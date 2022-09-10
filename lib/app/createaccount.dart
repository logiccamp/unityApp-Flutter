import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unitycargo/app/appconatiner.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/bll/signup_logic.dart';
import 'package:unitycargo/resources/app_authentication.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isLoading = false;
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AppAuthentication appAuthentication = AppAuthentication();

  @override
  void dispose() {
    // TODO: implement initState
    emailController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
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
                    'assets/images/img_plane.jpg',
                    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset("assets/images/logo1.png"),
                      const SizedBox(height: 40),
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
                                      top: size.width * .10,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                  component(
                                      Icons.account_circle_outlined,
                                      'First name...',
                                      false,
                                      false,
                                      firstnameController),
                                  component(
                                      Icons.account_circle_outlined,
                                      'Last name...',
                                      false,
                                      false,
                                      lastnameController),
                                  component(Icons.email_outlined, 'Email...',
                                      false, true, emailController),
                                  component(Icons.phone_enabled, 'Telephone...',
                                      false, false, phoneController),
                                  component(Icons.lock_outline, 'Password...',
                                      true, false, passwordController),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Forgotten password!',
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
                                            },
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Already have an account?',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()),
                                              );
                                            },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 60.0),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      final isValid =
                                          await appAuthentication.verifySignup(
                                              firstnameController.text,
                                              lastnameController.text,
                                              emailController.text,
                                              phoneController.text,
                                              passwordController.text);
                                      if (isValid != "valid") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(isValid.toString()),
                                            backgroundColor:
                                                Colors.red.withOpacity(0.6),
                                          ),
                                        );

                                        setState(() {
                                          isLoading = false;
                                        });
                                        return;
                                      }
                                      HapticFeedback.lightImpact();
                                      final signupBLL = await signup(
                                        emailController.text,
                                        passwordController.text,
                                        firstnameController.text,
                                        lastnameController.text,
                                        phoneController.text,
                                      );
                                      if (signupBLL == "success") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                                "Registration successful, please login"),
                                            backgroundColor:
                                                Colors.green.withOpacity(0.6),
                                          ),
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(signupBLL),
                                            backgroundColor:
                                                Colors.red.withOpacity(0.6),
                                          ),
                                        );
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .05,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.5,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isLoading
                                            ? Colors.grey.withOpacity(0.1)
                                            : Colors.black.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        isLoading ? 'Processing...' : 'Sign Up',
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
                      const Expanded(
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
