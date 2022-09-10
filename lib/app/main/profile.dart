import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/app/main/mypacel/change_password.dart';
import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/user_data.dart';

import '../../bll/profile_logic.dart';
import '../../utils/colors.dart';
import 'mypacel/page_header.dart';
import 'mypacel/title_with_avatar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var profileLogic = ProfileLogic();
  var appAuthentication = AppAuthentication();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var current_passwordController = TextEditingController();
  var confirm_passwordController = TextEditingController();
  var new_passwordController = TextEditingController();
  var passChangeReport = "";
  bool showpassChangeReport = false;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    getDetails();
    super.initState();
  }

  void getDetails() async {
    await appAuthentication.checkUser(context);
    User profile = await profileLogic.getProfile();
    setState(() {
      firstnameController.text = profile.firstname;
      lastnameController.text = profile.lastname;
      phoneController.text = profile.phone;
      addressController.text = profile.address;
      isLoading = false;
    });
  }

  void updateUser() async {
    setState(() {
      isLoading = true;
    });
    User userProfile = User(firstnameController.text, lastnameController.text,
        phoneController.text, addressController.text);
    var isValid = await appAuthentication.verifyProfileUpdate(userProfile);

    if (isValid != "valid") {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isValid),
        backgroundColor: Colors.red,
      ));
    }

    bool isSuccess = await profileLogic.updateProfile(userProfile);

    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Record updated"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something went wrong, please try again."),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _changePassord() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return changePasswordW();
          });
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: SingleChildScrollView(
        child: (Column(
          children: [
            PageHeader(size: size, title: "Profile"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  component(firstnameController, Iconsax.user, "Firstname",
                      false, false, false),
                  component(lastnameController, Iconsax.user, "Lastname", false,
                      false, false),
                  component(phoneController, Iconsax.user, "Telephone", false,
                      true, false),
                  component(addressController, Iconsax.user, "Pickup Address",
                      false, false, true),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                    size: size,
                    onpress: () {
                      if (!isLoading) updateUser();
                    },
                    text: isLoading ? "processing..." : "Update",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    size: size,
                    onpress: () async {
                      bool isUser = await appAuthentication.checkUser(context);
                      if (isUser) _changePassord();
                    },
                    text: "Change Password",
                    isMain: false,
                    textColor: Colors.black,
                    hasIcon: false,
                    textSize: 16,
                  ),
                ],
              ),
            ),
          ],
        )),
      )),
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
