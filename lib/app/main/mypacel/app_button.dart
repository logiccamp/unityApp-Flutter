import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.size,
    required this.onpress,
    this.text = 'Continue',
    this.isMain = true,
    this.hasIcon = true,
    this.textColor = Colors.white,
    this.textSize = 18,
  }) : super(key: key);
  Function onpress;
  final Size size;
  String text;
  bool isMain;
  bool hasIcon;
  Color textColor;
  double textSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // for now
        onpress();
      },
      child: Container(
        width: size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2 + 2),
        decoration: isMain
            ? BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 10,
                        blurStyle: BlurStyle.solid,
                        color: blueColor.withOpacity(0.3))
                  ])
            : const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon
                ? const Icon(
                    Iconsax.save_2,
                    color: Colors.white,
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: textSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
