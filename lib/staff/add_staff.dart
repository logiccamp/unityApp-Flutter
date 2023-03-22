import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/bll/profile_logic.dart';
import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/staff_data.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/staff/customers_staff.dart';
import 'package:unitycargo/utils/colors.dart';

import 'admin_search.dart';
import 'components/list_textfield_widget.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({Key? key}) : super(key: key);
  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  bool isLoading = false;
  var lastnameController = TextEditingController();
  var firstnameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var c_passwordController = TextEditingController();
  var passwordController = TextEditingController();
  String roleController = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    roleController = "Select Role";
  }

  void setRole(role) {
    setState(() {
      roleController = role;
    });
  }

  Future addStaff() async {
    var appAuthentication = AppAuthentication();
    Staff staff = Staff(
        firstnameController.text,
        lastnameController.text,
        phoneController.text,
        addressController.text,
        emailController.text,
        passwordController.text,
        roleController);
    String isValid = await appAuthentication.validateStaff(staff);
    if (isValid != "valid") {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isValid),
        backgroundColor: Colors.red.withOpacity(0.8),
      ));
      return;
    }

    if (passwordController.text != c_passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isValid),
        backgroundColor: Colors.red.withOpacity(0.8),
      ));
      return;
    }

    UsersClass usersClass = UsersClass();
    String isSuccess = await usersClass.AddStaff(staff);
    if (isSuccess == "true") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("New Staff Added"),
        backgroundColor: Colors.green,
      ));
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => const UsersList(user_type: "Staff"))));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isSuccess),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add New Staff"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                color: blueColor,
                width: double.maxFinite,
                padding: const EdgeInsets.all(kDefaultPadding * 2),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/user_avatar.png")),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: kDefaultPadding / 2),
                        child: Title(
                            color: Colors.white,
                            child: const Text(
                              "Add New Staff",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  kDefaultPadding / 2,
                ),
                child: Column(
                  children: [
                    ListTextFieldWidget(
                      controller: lastnameController,
                      hintText: "Lastname",
                      icon: Iconsax.user,
                    ),
                    ListTextFieldWidget(
                      controller: firstnameController,
                      hintText: "Firstname",
                      icon: Iconsax.user,
                    ),
                    ListTextFieldWidget(
                      controller: emailController,
                      hintText: "Email Address",
                      icon: Icons.mail_outline,
                    ),
                    ListTextFieldWidget(
                      controller: phoneController,
                      hintText: "Telephone",
                      icon: Icons.phone_android_outlined,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text("Role"),
                                content: Container(
                                  height: 100,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop(context);
                                          setRole("Driver");
                                          // print("hello");
                                        },
                                        child: Container(
                                          width: double.maxFinite,
                                          padding: const EdgeInsets.only(
                                              bottom: 10, left: 10),
                                          child: const Text(
                                            "Driver",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop(context);
                                          setRole("Staff");
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                          ),
                                          child: const Text(
                                            "Staff",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, bottom: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop(context);
                                      },
                                      child: const Text("close"),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      child: ListTile(
                        leading: const Icon(Icons.work_outline),
                        title: Row(
                          children: [
                            Expanded(
                                child: Text(
                              roleController,
                              style: TextStyle(
                                  color: roleController == "Select Role"
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black),
                            )),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    ListTextFieldWidget(
                      controller: passwordController,
                      hintText: "Enter Password",
                      isPassword: true,
                      icon: Icons.lock_outline,
                    ),
                    ListTextFieldWidget(
                      controller: c_passwordController,
                      hintText: "Confirm Password",
                      isPassword: true,
                      icon: Icons.lock_outline,
                    ),
                    ListTextFieldWidget(
                      controller: addressController,
                      hintText: "Address",
                      icon: Icons.home_outlined,
                    ),
                    const Divider(
                      height: 10,
                    ),
                    AppButton(
                        text: isLoading ? "Processing..." : "Save",
                        size: MediaQuery.of(context).size,
                        onpress: () {
                          setState(() {
                            isLoading = true;
                          });
                          addStaff();
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
