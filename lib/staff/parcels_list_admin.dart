import 'package:flutter/material.dart';
import 'package:unitycargo/app/main/mypacel/loading.dart';
import 'package:unitycargo/app/main/mypacel/parcel_card.dart';
import 'package:unitycargo/staff/login.dart';
import 'package:unitycargo/staff/parcel_details_admin.dart';
import 'package:unitycargo/staff/parcel_search.dart';
import 'package:unitycargo/utils/extensions.dart';

import '../app/main/mypacel/parcel_detail.dart';
import '../bll/parcels_logic.dart';
import '../resources/app_authentication.dart';
import '../resources/parcel_data.dart';
import '../utils/colors.dart';

class ParcelListAdmin extends StatefulWidget {
  const ParcelListAdmin({Key? key}) : super(key: key);

  @override
  State<ParcelListAdmin> createState() => _ParcelListAdminState();
}

class _ParcelListAdminState extends State<ParcelListAdmin> {
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
    var token = await appAuthentication.getTokenAdmin();
    user_token = token;
  }

  void getParcels() async {
    List<ParcelResponse> parcelsList_ = [];

    var response = await parcelLogic.AllParcelsAdmin();
    if (response["message"] == "Unauthenticated.") {
      //redirect to login page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StaffLogin()));
      return;
    }

    var parcels = response["data"];
    for (var p in parcels) {
      var pr = ParcelResponse.fromJson(p);
      parcelsList_.add(pr);
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Parcels List"),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ParcelSearch()));
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
          ? LoadingWidget(size: size)
          : ListView.builder(
              itemCount: parcelsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ParcelCard(
                  ontap: (trackingNumber) => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => AdminParcelDetails(
                            trackingNumber: trackingNumber))))
                  },
                  percent:
                      double.parse(parcelsList[index].percent.toString()) / 100,
                  updatedAt: parcelsList[index].updated.toString(),
                  parentWidth: parentWidth,
                  status: parcelsList[index].status.toString().capitalize(),
                  trackingNumber: parcelsList[index].tracking_id.toString(),
                );
              }),
    );
  }
}
