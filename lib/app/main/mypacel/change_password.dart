import 'package:flutter/material.dart';

import '../../../bll/profile_logic.dart';
import '../../../resources/app_authentication.dart';
import '../../../utils/colors.dart';
import 'app_button.dart';
import 'title_with_avatar.dart';

class changePasswordW extends StatefulWidget {
  changePasswordW({Key? key}) : super(key: key);

  @override
  State<changePasswordW> createState() => changePasswordWState();
}

class changePasswordWState extends State<changePasswordW> {
  var profileLogic = ProfileLogic();
  var appAuthentication = AppAuthentication();
  var current_passwordController = TextEditingController();
  var confirm_passwordController = TextEditingController();
  var new_passwordController = TextEditingController();
  var passChangeReport = "";
  bool showpassChangeReport = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    current_passwordController.dispose();
    confirm_passwordController.dispose();
    new_passwordController.dispose();
  }

  void changePassword() async {
    setState(() {
      isLoading = true;
      showpassChangeReport = false;
    });

    var isValid = await appAuthentication.validPasswordChange(
        current_passwordController.text,
        new_passwordController.text,
        confirm_passwordController.text);
    if (isValid != "valid") {
      setState(() {
        isLoading = false;
        showpassChangeReport = true;
        passChangeReport = isValid;
      });

      return;
    }
    var report = "";
    bool isSuccess = await profileLogic.updatePassword(
        current_passwordController.text,
        new_passwordController.text,
        confirm_passwordController.text);
    if (isSuccess) {
      report = "Password Changed successfully";
      appAuthentication.logout();
    } else {
      report = "Current password is incorrect";
    }

    setState(() {
      passChangeReport = report;
      showpassChangeReport = true;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        child: Container(
          decoration: const BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding / 2,
                      top: kDefaultPadding),
                  child: Column(
                    children: [
                      const Text(
                        "CHANGE PASSWORD",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      component(current_passwordController, Icons.usb,
                          "Current Password", false, false, false),
                      component(new_passwordController, Icons.usb,
                          "New Password", true, false, false),
                      component(confirm_passwordController, Icons.usb,
                          "Confirm Password", true, false, false),
                      const SizedBox(
                        height: 10,
                      ),
                      AppButton(
                        size: size,
                        text: isLoading ? "processing..." : "Save and Exit",
                        onpress: () {
                          if (isLoading == false) changePassword();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      showpassChangeReport
                          ? Text(
                              passChangeReport,
                              style: TextStyle(
                                  color: passChangeReport.contains("Changed")
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget component(TextEditingController controller, IconData icon,
      String hintText, bool isPassword, bool isPhone, bool isAddress) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding * 0.3, bottom: kDefaultPadding * 0.3),
      // width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: blueColor.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 4)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          TitleWithAvartar(
            text: hintText,
            textSize: 16,
            color: Colors.black54,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: isAddress ? 70 : 40,
            child: TextField(
              enabled: isLoading ? false : true,
              controller: controller,
              minLines: isAddress ? 3 : 1,
              maxLines: isAddress ? 5 : 1,
              style: TextStyle(
                color: Colors.black.withOpacity(.9),
              ),
              obscureText: isPassword,
              keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: blueColor)),
                hintMaxLines: isAddress ? 10 : 1,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
