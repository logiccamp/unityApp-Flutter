import 'package:flutter/material.dart';
import 'package:unitycargo/app/appconatiner.dart';

import '../../../utils/colors.dart';

class TitleWithAvartar extends StatelessWidget {
  TitleWithAvartar({
    Key? key,
    required this.text,
    required this.textSize,
    this.image = "",
    this.color = Colors.white,
    this.fontweight = FontWeight.w800,
    this.hasIcon = false,
    this.styledIcon = false,
    this.hasPrevIcon = false,
    this.icon = Icons.settings,
    this.prevIcon = Icons.settings,
    this.iconColor = Colors.black,
  }) : super(key: key);

  final String text;
  final double textSize;
  final String image;
  final Color color;
  final FontWeight fontweight;
  bool hasPrevIcon;
  bool hasIcon;
  bool styledIcon;
  IconData icon;
  IconData prevIcon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasPrevIcon
            ? Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding / 2),
                child: Icon(
                  prevIcon,
                  color: iconColor,
                ),
              )
            : Container(),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: color, fontSize: textSize, fontWeight: fontweight),
          ),
        ),
        hasIcon
            ? styledIcon
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppContainer(
                                selectedIndex: 2,
                              )));
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                      ),
                    ),
                  )
                : Icon(
                    icon,
                    color: color,
                  )
            : image == ""
                ? Container()
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppContainer(
                                selectedIndex: 2,
                              )));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.cover,
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  )
      ],
    );
  }
}
