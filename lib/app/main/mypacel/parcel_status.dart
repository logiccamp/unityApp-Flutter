import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import 'title_with_avatar.dart';

class ParcelStatus extends StatelessWidget {
  String trackingNumber;
  String updatedAt;
  String status;

  double percent;
  bool hideIcon;

  double parentWidth;

  ParcelStatus(
      {Key? key,
      required this.trackingNumber,
      required this.updatedAt,
      required this.status,
      required this.percent,
      required this.parentWidth,
      this.hideIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(trackingNumber,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                )),
            hideIcon == false
                ? Icon(Icons.more_vert,
                    color: status == 'Delivered' ? Colors.green : Colors.black)
                : Container()
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        TitleWithAvartar(
          text: status,
          textSize: 22,
          color: status == 'Delivered' ? Colors.green : Colors.black,
        ),
        TitleWithAvartar(
          text: "Last update: " + updatedAt,
          textSize: 16,
          fontweight: FontWeight.normal,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: parentWidth * percent,
                height: 5,
                decoration: BoxDecoration(
                    color: status == 'Delivered' ? Colors.green : blueColor,
                    borderRadius: BorderRadius.circular(5)),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  height: 5,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
