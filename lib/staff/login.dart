import 'package:flutter/material.dart';
import 'package:unitycargo/app/appconatiner.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/staff/dashboard_admin.dart';
import 'package:unitycargo/utils/colors.dart';

import '../bll/login_logic.dart';
import '../resources/app_authentication.dart';

class StaffLogin extends StatefulWidget {
  StaffLogin({Key? key}) : super(key: key);

  @override
  State<StaffLogin> createState() => StaffLoginState();
}

class StaffLoginState extends State<StaffLogin> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: blueColor,
              margin: const EdgeInsets.only(bottom: 50),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Container(
                      color: blueColor,
                      padding: EdgeInsets.all(kDefaultPadding),
                      margin: EdgeInsets.only(bottom: kDefaultPadding * 2),
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/logo1.png')),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: kDefaultPadding / 2, left: kDefaultPadding / 2),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen())),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 260,
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding * 2),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () async {
                      final loginBLL = await login(
                          emailController.text, passwordController.text);

                      if (loginBLL.success == true) {
                        if (loginBLL.user_role == "app_user") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Invalid permission, please use Customer's Login Page"),
                              backgroundColor: Colors.red.withOpacity(0.6),
                            ),
                          );
                        }

                        if (loginBLL.user_role == "admin") {
                          await appAuthentication.setToken(
                              loginBLL.token, "admin");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminDashboard()),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(loginBLL.message),
                            backgroundColor: Colors.red.withOpacity(0.6),
                          ),
                        );
                      }
                      setState(() => isLoading = false);
                    },
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
