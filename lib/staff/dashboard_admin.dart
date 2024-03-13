import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/staff/components/dashboard_card.dart';
import 'package:unitycargo/staff/customers_staff.dart';
import 'package:unitycargo/staff/login.dart';
import 'package:unitycargo/staff/parcels_list_admin.dart';
import 'package:unitycargo/utils/colors.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  var appAuthentication = AppAuthentication();
  UsersClass userClass_ = UsersClass();
  bool isLoading = true;
  var name = "";
  var email = "";
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    checkLogin();
    getAdmin();
  }

  void checkLogin() async {
    var token = await appAuthentication.getTokenAdmin();
    if (token == "null") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => StaffLogin()));
    }
  }

  Future<Null> getAdmin() async {
    User admin = await userClass_.Details().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
    setState(() {
      name = admin.firstname;
      email = admin.email;
    });
  }

  Future<Null> _refresh() {
    return getAdmin();
  }

  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;
    List DashboardList = [
      {
        "title": "Customers",
        "icon": "assets/images/users.png",
        "page": const UsersList()
      },
      {
        "title": "Staff",
        "icon": "assets/images/staffs.png",
        "page": const UsersList(
          user_type: "Staff",
        )
      },
      {
        "title": "Parcels",
        "icon": "assets/images/parcel.png",
        "page": const ParcelListAdmin()
      },
    ];
    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: isLoading == true
            ? LoadingWidget(size: size)
            : Stack(
                children: <Widget>[
                  Container(
                    height: size.height * .3,
                    color: blueColor,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 104,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontFamily: "Montserrat Medium",
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      email,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: "Montserrat Regular"),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        appAuthentication
                                            .removeTokenVariable("loggedin");
                                        appAuthentication.logout();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      },
                                      child: Container(
                                        child: Text("Sign out"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: DashboardList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    var title = DashboardList[index]["title"]
                                        .toString();
                                    var icon =
                                        DashboardList[index]["icon"].toString();
                                    var page = DashboardList[index]["page"];
                                    return DashboardCard(
                                      title: title,
                                      icon: icon,
                                      page: page,
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
