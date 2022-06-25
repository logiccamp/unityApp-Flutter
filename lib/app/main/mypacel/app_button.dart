

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.size, required this.onpress,
  }) : super(key: key);
  Function onpress;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // for now
        onpress();
      },
      child: Container(
        width: size.width * 0.8,
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2 + 2),
        decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  spreadRadius: 2,
                  blurRadius: 20,
                  blurStyle: BlurStyle.solid,
                  color: blueColor.withOpacity(0.3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Iconsax.save_2,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
