import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/page_header.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/utils/colors.dart';
import 'package:unitycargo/bll/select_time.dart';

class SendParcelRecepient extends StatefulWidget {
  SendParcelRecepient({Key? key}) : super(key: key);
  @override
  _SendParcelRecepientState createState() => _SendParcelRecepientState();
}

class _SendParcelRecepientState extends State<SendParcelRecepient> {
  String _state = "Select State";

  List<String> states = ["Select State", "Percel", "Document", "Box", "Pallet"];
  @override
  void initState() {
    String _staste = "Select State";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
