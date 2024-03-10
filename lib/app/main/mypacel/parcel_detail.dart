import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/resources/parcel_data.dart';
import 'package:unitycargo/utils/extensions.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../bll/parcels_logic.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import 'parcel_status.dart';
import 'title_with_avatar.dart';

class Details extends StatefulWidget {
  Details({
    Key? key,
    required this.size,
    required this.parentWidth,
    required this.trackingNumber,
  }) : super(key: key);

  final Size size;
  final double parentWidth;
  final String trackingNumber;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isLoading = true;
  Parcel parcelLogic = Parcel();
  bool isParcel = false;
  var utils = Utils();
  var Parcel_;
  @override
  void initState() {
    // TODO: implement initState
    isLoading = true;
    isParcel = false;
    super.initState();
    getParcel();
  }

  getParcel() async {
    var response = await parcelLogic.GetParcel(widget.trackingNumber);

    Timer(const Duration(seconds: 2), () {
      if (response["success"] == false) {
        setState(() {
          isParcel = false;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          isParcel = true;
          Parcel_ = response["data"];
          print(Parcel_);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: widget.size.height * 0.8,
            child: Center(
              child: SizedBox(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: blueColor,
                      ),
                      Text("Processing...", style: TextStyle(fontSize: 16)),
                    ]),
              ),
            ))
        : Container(
            child: isParcel
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TitleWithAvartar(
                              text: "Details",
                              fontweight: FontWeight.w900,
                              textSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.close_sharp),
                              onPressed: () => {Navigator.of(context).pop()},
                              splashRadius: 20,
                            ),
                          )
                        ],
                      ),
                      Column(children: [
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        ParcelStatus(
                            status: Parcel_["status"].toString().capitalize(),
                            updatedAt: Parcel_["last_update"].toString(),
                            trackingNumber: widget.trackingNumber,
                            parentWidth: widget.parentWidth,
                            percent:
                                double.parse(Parcel_["progress"].toString()) /
                                    100,
                            hideIcon: true),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Image.asset(
                          "assets/images/in_transit.png",
                          height: 300.0,
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        SizedBox(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: Parcel_["history"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: kDefaultPadding / 2),
                                          child: Image.asset(
                                            "assets/images/in_transit_circle.png",
                                            height: 54,
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TitleWithAvartar(
                                                color: Colors.black,
                                                text: Parcel_["history"][index]
                                                        ["report"]
                                                    .toString(),
                                                textSize: 20),
                                            TitleWithAvartar(
                                                color: Colors.black45,
                                                fontweight: FontWeight.normal,
                                                text: utils
                                                    .diffForHumans(
                                                        Parcel_["history"]
                                                                [index]
                                                            ["created_at"])
                                                    .toString()
                                                    .toString(),
                                                textSize: 16),
                                          ],
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ])
                    ],
                  )
                : SizedBox(
                    height: widget.size.height * 0.8,
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/notfound.jpg",
                                height: 180,
                                width: double.maxFinite,
                                fit: BoxFit.contain,
                              ),
                              const Text(
                                  "Invalid Tracking No., please try again.",
                                  style: TextStyle(fontSize: 18)),
                            ]),
                      ),
                    ),
                  ),
          );
  }
}
