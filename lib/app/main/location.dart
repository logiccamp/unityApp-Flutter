import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/page_header.dart';
import 'package:unitycargo/app/main/mypacel/parcel_final.dart';
import 'package:unitycargo/app/main/mypacel/pickup_summary.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/bll/location_logic.dart';
import 'package:unitycargo/resources/location_data.dart';
import 'package:unitycargo/utils/colors.dart';

import '../../utils/states_list.dart';
import 'mypacel/app_button.dart';
import 'mypacel/parcel_detail.dart';

class OurLocation extends StatefulWidget {
  OurLocation({Key? key}) : super(key: key);
  @override
  _OurLocationState createState() => _OurLocationState();
}

class _OurLocationState extends State<OurLocation> {
  String _state = "Select State";
  int _selectedDeliveryMode = 0;

  LocationLogic _locationLogic = LocationLogic();
  List<LocationResponse> locationList_ = [];

  @override
  void initState() {
    String _staste = "Select State";
    _selectedDeliveryMode = 0;
    fetchLocation();
    super.initState();
  }

  void fetchLocation() async {
    var response = await _locationLogic.Get();
    List<LocationResponse> locationList_2 = [];
    var parcels = response["data"];
    for (var p in parcels) {
      var pr = LocationResponse.fromJson(p);
      locationList_2.add(pr);
    }
    setState(() {
      locationList_ = locationList_2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Location"),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: locationList_.length,
          itemBuilder: (context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
              child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        color: blueColor.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      TitleWithAvartar(
                        text: locationList_[index].name,
                        textSize: 20,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Title(
                          color: Colors.black,
                          child: Text(
                            locationList_[index].address.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          locationList_[index].contact_person.toString() == ""
                              ? const Text("")
                              : Title(
                                  color: Colors.black,
                                  child: Text(
                                    locationList_[index]
                                            .contact_person
                                            .toString() +
                                        " : ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ),
                          locationList_[index].telephone.toString() == ""
                              ? const Text("")
                              : Title(
                                  color: Colors.black,
                                  child: Text(
                                    locationList_[index].telephone.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ),
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
