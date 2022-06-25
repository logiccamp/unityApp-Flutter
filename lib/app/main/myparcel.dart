import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/parcels.dart';
import 'package:unitycargo/utils/colors.dart';
import 'package:unitycargo/utils/package_list.dart';

import 'mypacel/parcel_card.dart';
import 'mypacel/parcel_detail.dart';
import 'mypacel/parcel_status.dart';
import 'mypacel/title_with_avatar.dart';
import 'mypacel/top_bar.dart';

class MyParcel extends StatefulWidget {
  const MyParcel({Key? key}) : super(key: key);

  @override
  _MyParcelState createState() => _MyParcelState();
}

class _MyParcelState extends State<MyParcel> {
  @override
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final parentWidth =
        size.width - (kDefaultPadding * 2 + (kDefaultPadding / 2 * 2));

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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.95,
            child: Column(
              children: [
                TopBar(size: size),
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
                                        builder: (context) =>
                                            const ParcelsList()),
                                  );
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return AlertDialog(
                                  //         title: Text("Message"),
                                  //         content: Text("Loading"),
                                  //         actions: [
                                  //           MaterialButton(
                                  //             onPressed: () {
                                  //               Navigator.of(context)
                                  //                   .pop(context);
                                  //             },
                                  //             child: Text("close"),
                                  //           )
                                  //         ],
                                  //       );
                                  //     });
                                },
                                child: Text(
                                  "View all",
                                  style: TextStyle(color: blueColor),
                                ))
                          ],
                        )),
                    ParcelCard(
                      ontap: (trackingNumber) =>
                          {_OpenParcel(context, trackingNumber)},
                      percent:
                          double.parse(packages[0]["percent"].toString()) / 100,
                      updatedAt: packages[0]["updated"].toString(),
                      parentWidth: parentWidth,
                      status: packages[0]["status"].toString(),
                      trackingNumber: packages[0]["tracking_id"].toString(),
                    ),
                    ParcelCard(
                      ontap: (trackingNumber) =>
                          {_OpenParcel(context, trackingNumber)},
                      percent:
                          double.parse(packages[1]["percent"].toString()) / 100,
                      updatedAt: packages[1]["updated"].toString(),
                      parentWidth: parentWidth,
                      status: packages[1]["status"].toString(),
                      trackingNumber: packages[1]["tracking_id"].toString(),
                    ),
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
