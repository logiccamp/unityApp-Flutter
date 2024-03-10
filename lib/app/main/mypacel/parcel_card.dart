import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import 'parcel_status.dart';
import 'title_with_avatar.dart';

class ParcelCard extends StatelessWidget {
  ParcelCard({
    Key? key,
    required this.parentWidth,
    this.percent = 0.7,
    required this.status,
    required this.trackingNumber,
    required this.updatedAt,
    required this.ontap,
  }) : super(key: key);

  final double parentWidth;
  final double percent;
  final String status;
  final String trackingNumber;
  final String updatedAt;
  Function ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 3),
                    color: blueColor.withOpacity(0.3),
                    blurRadius: 5)
              ]),
          child: InkWell(
            onTap: () => {ontap(trackingNumber)},
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  top: 10,
                  bottom: 10),
              child: Column(
                children: [
                  ParcelStatus(
                      status: status,
                      updatedAt: updatedAt,
                      trackingNumber: trackingNumber,
                      parentWidth: parentWidth,
                      percent: percent),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text("Details",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 2,
                          color: colorAcent,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
