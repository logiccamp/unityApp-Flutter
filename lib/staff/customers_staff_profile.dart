import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/bll/profile_logic.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/utils/colors.dart';

import 'admin_search.dart';
import 'components/list_textfield_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key, required this.id, this.user_type = "user"})
      : super(key: key);
  final String id;
  final String user_type;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var userClass = UsersClass();
  List<User> users_ = [];
  bool isLoading = true;
  List<User> profile = [];
  var u_ = User("", "", "", "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    getUser();
  }

  void getUser() async {
    User u = await userClass.GetUser(widget.id);
    setState(() {
      u_ = u;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: isLoading
          ? LoadingWidget(size: MediaQuery.of(context).size)
          : SingleChildScrollView(
              child: SafeArea(
                child: Stack(
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
                                      image: AssetImage(
                                          "assets/images/user_avatar.png")),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: kDefaultPadding / 2),
                                child: Title(
                                    color: Colors.white,
                                    child: Text(
                                      u_.firstname + " " + u_.lastname,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 220,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.mail,
                              color: blueColor,
                              size: 18,
                            ),
                            title: TitleWithAvartar(
                              text: u_.email,
                              textSize: 16.0,
                              fontweight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone_android,
                              color: blueColor,
                              size: 18,
                            ),
                            title: TitleWithAvartar(
                              text: u_.phone,
                              textSize: 16.0,
                              fontweight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.house_outlined,
                              color: blueColor,
                              size: 18,
                            ),
                            title: TitleWithAvartar(
                              text: u_.address,
                              textSize: 16.0,
                              fontweight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                          ),
                          widget.user_type == "Users"
                              ? ListTile(
                                  leading: Icon(
                                    Icons.diamond_outlined,
                                    color: blueColor,
                                    size: 18,
                                  ),
                                  title: TitleWithAvartar(
                                    text: u_.Parcels.length.toString(),
                                    textSize: 16.0,
                                    fontweight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Divider(
                                      thickness: 1.0,
                                    ),
                                  ),
                                )
                              : Container(),
                          widget.user_type == "Staff"
                              ? Column(
                                  children: [
                                    AppButton(
                                        text: "Edit Staff",
                                        size: MediaQuery.of(context).size,
                                        onpress: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return EditStaff(
                                                  u_: u_,
                                                  f: () {
                                                    getUser();
                                                  },
                                                );
                                              });
                                        }),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Change Password",
                                            style: TextStyle(color: grayshade)))
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class EditStaff extends StatefulWidget {
  const EditStaff({
    Key? key,
    required this.u_,
    required this.f,
  }) : super(key: key);
  final User u_;
  final Function f;

  @override
  State<EditStaff> createState() => _EditStaffState();
}

class _EditStaffState extends State<EditStaff> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var firstnameController = TextEditingController();
    var lastnameController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();
    bool isLoading = false;
    emailController.text = widget.u_.email;
    firstnameController.text = widget.u_.firstname;
    lastnameController.text = widget.u_.lastname;
    phoneController.text = widget.u_.phone;
    addressController.text = widget.u_.address;

    @override
    void initState() {
      super.initState();
      isLoading = false;
    }

    void saveDetails() async {
      setState(() {
        isLoading = true;
      });
      var usersClass = UsersClass();
      bool isSuccess = await usersClass.updateUser(
          emailController.text,
          firstnameController.text,
          lastnameController.text,
          phoneController.text,
          addressController.text,
          widget.u_.id);

      setState(() {
        isLoading = false;
      });
      if (isSuccess == true) {
        widget.f();
        Navigator.of(context).pop();
      }
    }

    return Material(
      color: Colors.black.withOpacity(0.2),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: blueColor.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      )
                    ]),
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      TitleWithAvartar(
                          text: "Edit Staff 1",
                          textSize: 16,
                          color: Colors.black,
                          fontweight: FontWeight.normal),
                      const Divider(
                        height: 10,
                      ),
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
                        icon: Icons.mail,
                      ),
                      ListTextFieldWidget(
                        controller: phoneController,
                        hintText: "Telephone",
                        icon: Icons.phone,
                      ),
                      ListTextFieldWidget(
                        controller: addressController,
                        hintText: "Address",
                        icon: Icons.home,
                      ),
                      Divider(
                        height: 10,
                      ),
                      AppButton(
                          text: isLoading ? "Processing..." : "Save",
                          size: MediaQuery.of(context).size,
                          onpress: () {
                            isLoading ? () {} : saveDetails();
                          })
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
}
