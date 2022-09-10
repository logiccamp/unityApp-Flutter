import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';
import 'title_with_avatar.dart';

class TopBar extends StatelessWidget {
  TopBar({
    Key? key,
    required this.size,
    required this.searchboxController,
    required this.onpress,
  }) : super(key: key);

  final Size size;
  TextEditingController searchboxController;
  Function onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kTopSpacing, left: kDefaultPadding, right: kDefaultPadding),
      height: size.height * 0.4,
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 40,
            color: blueColor.withOpacity(0.35),
          )
        ],
        color: blueColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(kDefaultPadding),
          bottomRight: Radius.circular(kDefaultPadding),
        ),
      ),
      child: Column(
        children: [
          TitleWithAvartar(
            text: "Track Parcel",
            textSize: kTitleSize,
            hasIcon: true,
            icon: Iconsax.user,
            styledIcon: true,
          ),
          const SizedBox(
            height: 85.0,
          ),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter parcel tracking id",
                  // "ENTER PARCEL TRACKING",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: blueColor.withOpacity(0.3),
                                      offset: const Offset(0, 10),
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: searchboxController,
                              autofocus: false,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "tracking number"),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          onpress();
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Iconsax.box_search,
                            color: blueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
