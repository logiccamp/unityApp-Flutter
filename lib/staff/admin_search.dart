import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/app/main/mypacel/not_found.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/staff/customers_staff_profile.dart';
import 'package:unitycargo/utils/colors.dart';

import 'components/admin_users_staff_card.dart';

class AdminSearch extends StatefulWidget {
  AdminSearch({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<AdminSearch> createState() => _AdminSearchState();
}

class _AdminSearchState extends State<AdminSearch> {
  var search_input = TextEditingController();
  bool isLoading = false;
  bool isUsers = false;
  List users = [];
  UsersClass usersClass = UsersClass();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void GetUser(value) async {
    if (value == "") return;
    List<User> usersList = [];
    var u_ = await usersClass.filterUser(widget.type, value);
    for (var user in u_) {
      User u = User.fromJson(user);
      usersList.add(u);
    }
    if (usersList.isEmpty) {
      setState(() {
        isUsers = false;
      });
    } else {
      setState(() {
        users = usersList;
        isUsers = true;
      });
    }
  }

  void viewProfile(id) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (conetxt) => UserProfile(
              id: id,
              user_type: widget.type,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String message = "Search for " + widget.type;

    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? LoadingWidget(
              size: size,
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      color: blueColor,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding / 2),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                GetUser(value);
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              controller: search_input,
                              autofocus: true,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  fillColor: blueColor,
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  hintText: "Search by name or email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                          ),
                          widget.type == "Package"
                              ? InkWell(
                                  onTap: () => GetUser(search_input.text),
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Iconsax.box_search,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: size.height - 100,
                        child: ListView.builder(
                            itemCount: isUsers ? users.length : 1,
                            itemBuilder: (context, int index) {
                              return isUsers
                                  ? AdminUserCard(
                                      user_type: widget.type,
                                      fullname: users[index].firstname +
                                          " " +
                                          users[index].lastname,
                                      parcelCount: widget.type == "users"
                                          ? users[index].Parcels.length
                                          : 0,
                                      viewProfile: () {
                                        viewProfile(users[index].id);
                                      },
                                    )
                                  : NotFound(
                                      message: message,
                                      size: size.height * 0.6,
                                    );
                            })),
                  ],
                ),
              ),
            ),
    );
  }
}
