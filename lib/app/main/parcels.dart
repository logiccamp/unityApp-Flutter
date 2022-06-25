import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unitycargo/app/main/mypacel/parcel_card.dart';
import 'package:unitycargo/utils/package_list.dart';

import '../../utils/colors.dart';
import 'mypacel/parcel_detail.dart';

class ParcelsList extends StatelessWidget {
  const ParcelsList({Key? key}) : super(key: key);

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
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Parcels',
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ParcelCard(
              ontap: (trackingNumber) =>
                          {_OpenParcel(context, trackingNumber)},
              parentWidth: parentWidth,
              status: packages[index]["status"].toString(),
              trackingNumber: packages[index]["tracking_id"].toString(),
              updatedAt: packages[index]["updated"].toString(),
              percent:
                  double.parse(packages[index]["percent"].toString()) / 100,
            );
          }),
    );
  }
}
