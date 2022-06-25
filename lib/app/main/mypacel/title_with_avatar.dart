import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TitleWithAvartar extends StatelessWidget {
  TitleWithAvartar(
      {Key? key,
      required this.text,
      required this.textSize,
      this.image = "",
      this.color = Colors.white, this.fontweight = FontWeight.w800})
      : super(key: key);

  final String text;
  final double textSize;
  final String image;
  final Color color;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: color, fontSize: textSize, fontWeight: fontweight),
          ),
        ),
        image == ""
            ? Container()
            : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ),
              )
      ],
    );
  }
}
