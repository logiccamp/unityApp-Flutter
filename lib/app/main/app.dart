import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/appconatiner.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/app/main/location.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/app/main/price_list.dart';
import 'package:unitycargo/resources/app_authentication.dart';

import '../../utils/colors.dart';
import '../../utils/states_list.dart';
import 'mypacel/page_header.dart';
import 'mypacel/title_with_avatar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    void _routePage(title) async {
      switch (title) {
        case "Price List":
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PriceList()));
          break;
        case "Our Location":
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OurLocation()));
          break;
        case "Logout":
          AppAuthentication appAuthentication = AppAuthentication();
          await appAuthentication.logout();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          break;
        default:
      }
    }

    void _routeInPage(title) {
      switch (title) {
        case "My Parcels":
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AppContainer(selectedIndex: 0)));
          break;
        case "Send Parcels":
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AppContainer(selectedIndex: 1)));
          break;
        case "My Profile":
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AppContainer(selectedIndex: 2)));
          break;
      }
    }

    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: SingleChildScrollView(
        child: (Column(
          children: [
            PageHeader(size: size, title: "App"),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
              child: SizedBox(
                height: size.height * 0.6,
                child: ListView.builder(
                  itemCount: appList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          if (appList[index]["routetype"] == "page") {
                            _routePage(appList[index]["title"].toString());
                          } else {
                            _routeInPage(appList[index]["title"].toString());
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2 + 5, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.black.withOpacity(0.1))
                              ]),
                          child: TitleWithAvartar(
                            text: appList[index]["title"].toString(),
                            textSize: 17,
                            color: Color.fromARGB(255, 78, 78, 78),
                            hasIcon: true,
                            hasPrevIcon: true,
                            prevIcon: Icons.money,
                            // prevIcon: Icons.appList[index]["icondata"].toString()),
                            iconColor: blueColor,
                            fontweight: FontWeight.w600,
                            icon: Icons.keyboard_arrow_right,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Thank you for your patronage",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Version - 1.0.0 Beta",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withAlpha(100)),
                )
              ],
            )
          ],
        )),
      )),
    );
  }
}
