import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';
import 'parcel_status.dart';
import 'title_with_avatar.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.size,
    required this.parentWidth,
    required this.trackingNumber,
  }) : super(key: key);

  final Size size;
  final double parentWidth;
  final String trackingNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: IconButton(
                icon: const Icon(Icons.close_sharp),
                onPressed: () => {Navigator.of(context).pop()},
                splashRadius: 20,
              ),
            )
          ],
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Column(children: [
          const SizedBox(
            height: kDefaultPadding,
          ),
          ParcelStatus(
              status: "In trasit",
              updatedAt: "3 hours ago",
              trackingNumber: trackingNumber,
              parentWidth: parentWidth,
              percent: 70 / 100,
              hideIcon: true),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Image.asset(
            "assets/images/in_transit.png",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          SizedBox(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWithAvartar(
                                  color: Colors.black,
                                  text: "Parcel in transit",
                                  textSize: 20),
                              TitleWithAvartar(
                                  color: Colors.black45,
                                  fontweight: FontWeight.normal,
                                  text: "23-23-2929 - 13:12",
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
    );
  }
}
