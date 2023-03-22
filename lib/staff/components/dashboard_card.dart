import 'package:flutter/material.dart';
import 'package:unitycargo/app/login.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard({Key? key, required this.title, required this.icon, required this.page}) : super(key: key);

  final String title;
  final String icon;
  final Widget page;

  var cardTextStyle = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 14,
      color: Color.fromRGBO(63, 63, 63, 1));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icon),
                ),
              ),
            ),
            Text(
              title,
              style: cardTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
