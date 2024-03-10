import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/app/main/location.dart';
import 'package:unitycargo/app/main/myparcel.dart';
import 'package:unitycargo/app/main/profile.dart';
import 'package:unitycargo/app/main/sendparcel.dart';

import '../app/main/price_list.dart';

List<String> states = [
  "Select State",
  "Abia",
  "Adamawa",
  "Akwa Ibom",
  "Anambra",
  "Bauchi",
  "Bayelsa",
  "Benue",
  "Borno",
  "Cross River",
  "Delta",
  "Ebonyi",
  "Edo",
  "Ekiti",
  "Enugu",
  "FCT - Abuja",
  "Gombe",
  "Imo",
  "Jigawa",
  "Kaduna",
  "Kano",
  "Katsina",
  "Kebbi",
  "Kogi",
  "Kwara",
  "Lagos",
  "Nasarawa",
  "Niger",
  "Ogun",
  "Ondo",
  "Osun",
  "Oyo",
  "Plateau",
  "Rivers",
  "Sokoto",
  "Taraba",
  "Yobe",
  "Zamfara"
];

var appList = [
  {
    "title": "Price List",
    "routetype": "page",
    "route": PriceList(),
    "icondata": "money_sharp"
  },
  {
    "title": "Our Location",
    "routetype": "page",
    "route": OurLocation(),
    "icondata": "house_sharp"
  },
  {
    "title": "My Parcels",
    "routetype": "in",
    "route": const MyParcel(),
    "icondata": "diamond_sharp"
  },
  {
    "title": "Send Parcels",
    "routetype": "in",
    "route": SendParcel(),
    "icondata": "toll_sharp"
  },
  {
    "title": "My Profile",
    "routetype": "in",
    "route": const Profile(),
    "icondata": "settings"
  },
  {
    "title": "Logout",
    "routetype": "page",
    "route": const LoginScreen(),
    "icondata": "logout_sharp"
  },
];
