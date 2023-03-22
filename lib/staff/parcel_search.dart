import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/app/main/mypacel/not_found.dart';
import 'package:unitycargo/utils/colors.dart';

import 'components/admin_users_staff_card.dart';
import 'customers_staff_profile.dart';

class ParcelSearch extends StatefulWidget {
  ParcelSearch({Key? key}) : super(key: key);
  @override
  State<ParcelSearch> createState() => _ParcelSearchState();
}

class _ParcelSearchState extends State<ParcelSearch> {
  var search_input = TextEditingController();
  bool isLoading = false;
  bool isUsers = false;
  List users = [];

  void viewProfile(id) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (conetxt) => UserProfile(
              id: id,
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    isLoading = false;
    isUsers = false;
    super.initState();
  }

  void GetUser() {
    print("ello");
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String message = "Please enter tracking number";

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
                                  hintText: "tracking number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                          ),
                          InkWell(
                            onTap: GetUser,
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
                        ],
                      ),
                    ),
                    SizedBox(
                        height: size.height - 100,
                        child: ListView.builder(
                            itemCount: isUsers ? 10 : 1,
                            itemBuilder: (context, int index) {
                              return isUsers
                                  ? AdminUserCard(
                                      viewProfile: () {
                                        viewProfile("1");
                                      },
                                      user_type: "parcel",
                                      fullname: "Agbani Darego",
                                      parcelCount: 20)
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
