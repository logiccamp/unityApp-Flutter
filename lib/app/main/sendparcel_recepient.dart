import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/page_header.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/utils/colors.dart';
import 'package:unitycargo/bll/select_time.dart';

import 'mypacel/app_button.dart';
import 'mypacel/parcel_detail.dart';

class SendParcelRecepient extends StatefulWidget {
  SendParcelRecepient({Key? key}) : super(key: key);
  @override
  _SendParcelRecepientState createState() => _SendParcelRecepientState();
}

class _SendParcelRecepientState extends State<SendParcelRecepient> {
  String _state = "Select State";
  int _selectedDeliveryMode = 0;
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

  @override
  void initState() {
    String _staste = "Select State";
    _selectedDeliveryMode = 0;
    super.initState();
  }

  List delivery_mode = [
    {"value": "Collection from our office", "icon": "assets/icons/pickup.svg"},
    {"value": "Delivery to an address", "icon": "assets/icons/delivery.svg"}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void _OpenParcel(context, id) {
      showDialog(
          barrierColor: Colors.black.withOpacity(0.7),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(kDefaultPadding),
                              topRight: Radius.circular(kDefaultPadding)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(10, 0),
                                color: blueColor.withOpacity(0.5),
                                blurRadius: 10),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            right: kDefaultPadding,
                            top: kDefaultPadding * 2,
                            bottom: kDefaultPadding),
                        child: Details(
                          size: size,
                          parentWidth: 200,
                          trackingNumber: id,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Recepient Info"),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            // height: size.height * 0.95 + 110,
            child: Column(
              children: [
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(children: [
                      const SizedBox(height: kTopSpacing / 2),
                      TitleWithAvartar(
                          text: "Item Pickup / Recepient Info",
                          textSize: 20,
                          color: Colors.black54),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      component(Iconsax.user, "Firstname", false, false, false),
                      component(Iconsax.user, "Lastname", false, false, false),
                      component(Iconsax.user, "Receiver's Address", false,
                          false, true),
                      component(
                          Iconsax.user, "Phone number 1", false, false, false),
                      component(
                          Iconsax.user, "Phone number 2", false, false, false),
                      component(Iconsax.user, "City", false, false, false),
                      StateSelect(size),
                      const SizedBox(height: 20),
                      TitleWithAvartar(
                        text: "Delivery Mode",
                        textSize: 16,
                        color: Colors.black54,
                      ),
                      DeliveryMode(),
                      const SizedBox(height: 20),
                      AppButton(
                          size: size,
                          onpress: () =>
                              _OpenParcel(context, "ahsdflhaksfdlk")),
                      const SizedBox(height: 20),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox DeliveryMode() {
    return SizedBox(
      child: GridView.builder(
        itemCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: InkWell(
              onTap: () => {
                setState(() {
                  _selectedDeliveryMode = index;
                })
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: _selectedDeliveryMode == index ? 150 : 120,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: _selectedDeliveryMode == index
                            ? blueColor
                            : blueColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: blueColor,
                            width: _selectedDeliveryMode == index ? 3 : 0)),
                    child: Center(
                      child: SvgPicture.asset(
                        delivery_mode[index]["icon"].toString(),
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    delivery_mode[index]["value"].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget component(IconData icon, String hintText, bool isPassword,
      bool isEmail, bool isAddress) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: kDefaultPadding / 2 + 5,
          bottom: isAddress ? 0 : kDefaultPadding / 2 + 5),
      // width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      child: Column(
        children: [
          TitleWithAvartar(
            text: hintText,
            textSize: 16,
            color: Colors.black54,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: isAddress ? 70 : 45,
            child: TextField(
              style: TextStyle(
                color: Colors.black.withOpacity(.9),
              ),
              obscureText: isPassword,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: blueColor)),
                hintMaxLines: isAddress ? 10 : 1,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container StateSelect(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2 + 5),
      // width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      child: Column(
        children: [
          TitleWithAvartar(
            text: "Select State",
            textSize: 16,
            color: Colors.black54,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 45,
            child: DropdownButtonFormField(
                value: _state,
                hint: Text(_state),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _state = value.toString();
                  });
                },
                items: states.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton.extended(
//         onPressed: (){},
//         icon: Icon(Iconsax.save_2),
//         label: Text('Submit'),
//       ),
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
