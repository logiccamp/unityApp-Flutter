import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unitycargo/app/main/mypacel/not_found.dart';
import 'package:unitycargo/app/main/mypacel/parcel_card.dart';
import 'package:unitycargo/utils/extensions.dart';
import 'package:unitycargo/utils/package_list.dart';

import '../../bll/parcels_logic.dart';
import '../../resources/app_authentication.dart';
import '../../resources/parcel_data.dart';
import '../../utils/colors.dart';
import '../login.dart';
import 'mypacel/loading.dart';
import 'mypacel/parcel_detail.dart';

class ParcelsList extends StatefulWidget {
  ParcelsList({Key? key}) : super(key: key);

  @override
  State<ParcelsList> createState() => _ParcelsListState();
}

class _ParcelsListState extends State<ParcelsList> {
  Parcel parcelLogic = Parcel();

  List<ParcelResponse> parcelsList = [];

  String user_token = "";
  bool isLoading = true;
  var appAuthentication = AppAuthentication();

  @override
  void initState() {
    // TODO: implement initState
    getToken();
    getParcels();
    super.initState();
  }

  void getToken() async {
    var token = await appAuthentication.getToken();
    user_token = token;
  }

  void getParcels() async {
    List<ParcelResponse> parcelsList_ = [];

    var response = await parcelLogic.MyParcels(0);
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
      isLoading = false;
      parcelsList = parcelsList_;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final parentWidth =
        size.width - (kDefaultPadding * 2 + (kDefaultPadding / 2 * 2));

    var rand = Random();

    void _OpenParcel(context, id) {
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

    return Scaffold(
        backgroundColor: parcelsList.isEmpty ? Colors.white : Colors.grey[50],
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'Parcels',
          ),
        ),
        body: isLoading
            ? SizedBox(
                height: size.height * 90, child: LoadingWidget(size: size))
            : parcelsList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: parcelsList.length,
                    itemBuilder: (context, int index) {
                      return ParcelCard(
                        ontap: (trackingNumber) =>
                            {_OpenParcel(context, trackingNumber)},
                        percent: double.parse(
                                parcelsList[index].percent.toString()) /
                            100,
                        updatedAt: parcelsList[index].updated.toString(),
                        parentWidth: parentWidth,
                        status:
                            parcelsList[index].status.toString().capitalize(),
                        trackingNumber:
                            parcelsList[index].tracking_id.toString(),
                      );
                    })
                : NotFound(size: size.height, message: "No item found"));
  }
}
