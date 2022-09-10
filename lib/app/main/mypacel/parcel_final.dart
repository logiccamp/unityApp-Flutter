import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/appconatiner.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';

import '../../../utils/colors.dart';
import 'parcel_status.dart';
import 'title_with_avatar.dart';

class ParcelFinal extends StatelessWidget {
  ParcelFinal({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/thankyou.png",
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleWithAvartar(
                  text: "Thank you.",
                  textSize: 24,
                  color: Colors.black,
                ),
                TitleWithAvartar(
                  text: "We have received your pick up request.",
                  textSize: 24,
                  color: Colors.black,
                  fontweight: FontWeight.w300,
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  size: size,
                  onpress: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AppContainer(
                        selectedIndex: 0,
                      ),
                    ))
                  },
                  text: "Return",
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
