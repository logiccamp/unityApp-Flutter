import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/staff/add_staff.dart';
import 'package:unitycargo/staff/components/admin_users_staff_card.dart';
import 'package:unitycargo/utils/colors.dart';

import 'admin_search.dart';
import 'customers_staff_profile.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key, this.user_type = "Users"}) : super(key: key);
  final String user_type;
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  var userClass = UsersClass();
  List<User> users_ = [];
  bool isLoading = true;
  void getUsers() async {
    var response = await userClass.Get(widget.user_type);
    var us = response["data"];
    for (var u in us) {
      var pr = User.fromJson(u);
      users_.add(pr);
    }

    setState(() {
      isLoading = false;
    });
  }

  void viewProfile(id) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (conetxt) => UserProfile(
              id: id,
              user_type: widget.user_type,
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.user_type),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.user_type == "Staff"
                  ? InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => AddStaff())));
                      },
                      child: Icon(
                        Icons.add_outlined,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AdminSearch(
                            type: widget.user_type,
                          )));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: isLoading
          ? LoadingWidget(size: MediaQuery.of(context).size)
          : ListView.builder(
              itemCount: users_.length,
              itemBuilder: (BuildContext context, int index) {
                return AdminUserCard(
                    viewProfile: () {
                      viewProfile(users_[index].id);
                    },
                    fullname: users_[index].firstname.toString() +
                        " " +
                        users_[index].lastname.toString(),
                    user_type: widget.user_type.toString(),
                    parcelCount: users_[index].Parcels.length);
              }),
    );
  }
}
