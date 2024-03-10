import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/app/main/mypacel/not_found.dart';
import 'package:unitycargo/app/main/parcels.dart';
import 'package:unitycargo/bll/parcels_logic.dart';
import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/utils/colors.dart';
import 'package:unitycargo/utils/extensions.dart';
import 'package:unitycargo/utils/package_list.dart';

import '../../resources/parcel_data.dart';
import 'mypacel/parcel_card.dart';
import 'mypacel/parcel_detail.dart';
import 'mypacel/parcel_final.dart';
import 'mypacel/parcel_status.dart';
import 'mypacel/title_with_avatar.dart';
import 'mypacel/top_bar.dart';

class MyParcel extends StatefulWidget {
  const MyParcel({Key? key}) : super(key: key);

  @override
  _MyParcelState createState() => _MyParcelState();
}

class _MyParcelState extends State<MyParcel> {
  Parcel parcelLogic = Parcel();
  List<ParcelResponse> parcelsList = [];
  String user_token = "";
  bool isLoading = true;
  var appAuthentication = AppAuthentication();
  var searchBoxController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    getParcels();
  }

  void getToken() async {
    var token = await appAuthentication.getToken();
    user_token = token;
  }

  void getParcels() async {
    var checkUser = await appAuthentication.checkUser(context);
    List<ParcelResponse> parcelsList_ = [];
    if (checkUser) {
      var response = await parcelLogic.MyParcels(2);
      if (response["message"] == "Unauthenticated.") {
        //redirect to login page
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
      var parcels = response["data"];
      if (response["success"] == true) {
        for (var p in parcels) {
          var pr = ParcelResponse.fromJson(p);
          parcelsList_.add(pr);
        }
      }
      setState(() {
        parcelsList = parcelsList_;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // appAuthentication.checkUser(context);
    final Size size = MediaQuery.of(context).size;
    final parentWidth =
        size.width - (kDefaultPadding * 2 + (kDefaultPadding / 2 * 2));
    void _OpenParcel(context, id) async {
      showDialog(
          barrierColor: Colors.black.withOpacity(0.7),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(kDefaultPadding),
                              topRight: Radius.circular(kDefaultPadding)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(10, 0),
                                color: blueColor.withOpacity(0.5),
                                blurRadius: 10),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            right: kDefaultPadding,
                            top: kDefaultPadding * 2,
                            bottom: kDefaultPadding),
                        child: Details(
                          size: size,
                          parentWidth: parentWidth,
                          trackingNumber: id,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: parcelsList.isEmpty ? Colors.white : Colors.grey[50],
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                TopBar(
                  size: size,
                  searchboxController: searchBoxController,
                  onpress: () => {
                    if (searchBoxController.text != "")
                      _OpenParcel(context, searchBoxController.text)
                  },
                ),
                Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                            top: kDefaultPadding,
                            // bottom: kDefaultPadding,
                            left: kDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Recent Parcels",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ParcelsList()),
                                  );
                                },
                                child: Text(
                                  "View all",
                                  style: TextStyle(color: blueColor),
                                ))
                          ],
                        )),
                    isLoading
                        ? SizedBox(
                            height: 400, child: LoadingWidget(size: size))
                        : parcelsList.isNotEmpty
                            ? SizedBox(
                                height: 400,
                                child: ListView.builder(
                                  itemCount: parcelsList.length,
                                  itemBuilder: (context, int index) {
                                    return ParcelCard(
                                      ontap: (trackingNumber) => {
                                        _OpenParcel(context, trackingNumber)
                                      },
                                      percent: double.parse(parcelsList[index]
                                              .percent
                                              .toString()) /
                                          100,
                                      updatedAt:
                                          parcelsList[index].updated.toString(),
                                      parentWidth: parentWidth,
                                      status: parcelsList[index]
                                          .status
                                          .toString()
                                          .capitalize(),
                                      trackingNumber: parcelsList[index]
                                          .tracking_id
                                          .toString(),
                                    );
                                  },
                                ),
                              )
                            : NotFound(size: 400.0, message: "No item found")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
