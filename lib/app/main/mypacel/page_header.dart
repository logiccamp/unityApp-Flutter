import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';
import 'title_with_avatar.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kTopSpacing, left: kDefaultPadding, right: kDefaultPadding),
      height: size.height * 0.2,
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
            text: title,
            textSize: kTitleSize,
            hasIcon: true,
            icon: Iconsax.user,
            styledIcon: true,
          ),
        ],
      ),
    );
  }
}
