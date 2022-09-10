import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/App.dart';
import 'package:unitycargo/app/main/myparcel.dart';
import 'package:unitycargo/app/main/profile.dart';
import 'package:unitycargo/app/main/sendparcel.dart';

class AppContainer extends StatefulWidget {
  AppContainer({Key? key, this.selectedIndex = 0}) : super(key: key);
  int selectedIndex = 0;
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final Screens = [
    MyParcel(),
    SendParcel(),
    Profile(),
    App(),
  ];

  @override
  Widget build(BuildContext context) {
    int _index = widget.selectedIndex;
    return Scaffold(
        body: Screens[_index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              backgroundColor: Color(0xFFF1f5fb),
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
            height: 70,
            selectedIndex: _index,
            animationDuration: Duration(seconds: 2),
            onDestinationSelected: (index) => {
              setState(() => {_index = index, widget.selectedIndex = index})
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.weight),
                  selectedIcon: Icon(Iconsax.weight),
                  label: 'My Parcel'),
              NavigationDestination(
                  icon: Icon(Iconsax.send),
                  selectedIcon: Icon(Iconsax.send),
                  label: 'Send Parcel'),
              NavigationDestination(
                  icon: Icon(Iconsax.setting),
                  selectedIcon: Icon(Iconsax.setting),
                  label: 'Profile'),
              NavigationDestination(
                  icon: Icon(Icons.breakfast_dining_outlined),
                  selectedIcon: Icon(Icons.breakfast_dining_outlined),
                  label: 'App'),
            ],
          ),
        ));
  }
}
