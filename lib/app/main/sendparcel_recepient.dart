import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/appconatiner.dart';
import 'package:unitycargo/app/main/mypacel/page_header.dart';
import 'package:unitycargo/app/main/mypacel/parcel_final.dart';
import 'package:unitycargo/app/main/mypacel/pickup_summary.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/resources/first_step.dart';
import 'package:unitycargo/resources/second_step.dart';
import 'package:unitycargo/utils/colors.dart';

import '../../resources/app_authentication.dart';
import '../../utils/states_list.dart';
import '../../bll/parcels_logic.dart';
import 'mypacel/app_button.dart';
import 'mypacel/parcel_detail.dart';

class SendParcelRecepient extends StatefulWidget {
  SendParcelRecepient({Key? key, required this.firstStep}) : super(key: key);
  FirstStep firstStep;
  @override
  _SendParcelRecepientState createState() => _SendParcelRecepientState();
}

class _SendParcelRecepientState extends State<SendParcelRecepient> {
  String _state = "Select State";
  int _selectedDeliveryMode = 0;
  var appAuthentication = AppAuthentication();
  Parcel parcelLogic = Parcel();
  bool isLoading = false;
  TextEditingController r_firstname = TextEditingController();
  TextEditingController r_lastname = TextEditingController();
  TextEditingController r_address = TextEditingController();
  TextEditingController r_phone1 = TextEditingController();
  TextEditingController r_phone2 = TextEditingController();
  TextEditingController r_city = TextEditingController();
  SecondStep secondStep = SecondStep("", "", "", "", "", "", "", "");
  @override
  void initState() {
    String _staste = "Select State";
    _selectedDeliveryMode = 0;
    validateFirstStep();
    isLoading = false;
    super.initState();
  }

  List delivery_mode = [
    {"value": "Collection from our office", "icon": "assets/icons/pickup.svg"},
    {"value": "Delivery to an address", "icon": "assets/icons/delivery.svg"}
  ];

  Future validateFirstStep() async {
    String isValid =
        await appAuthentication.validateFirstStep(widget.firstStep);

    if (isValid != "valid") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter sender's information"),
        backgroundColor: Colors.red,
      ));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppContainer(selectedIndex: 1),
        ),
      );
      return;
    }
  }

  Future submitRequest() async {
    // firstname, lastname, address, phone1, phone2, city, state, deliveryMode
    setState(() {
      secondStep = SecondStep(
          r_firstname.text,
          r_lastname.text,
          r_address.text,
          r_phone1.text,
          r_phone2.text,
          r_city.text,
          _state,
          delivery_mode[_selectedDeliveryMode]["value"].toString());
    });

    String isValid =
        await appAuthentication.validateFirstStep(widget.firstStep);
    setState(() {
      isLoading = false;
    });
    if (isValid != "valid") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter sender's information"),
        backgroundColor: Colors.red,
      ));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppContainer(selectedIndex: 1),
        ),
      );
      return;
    }
    String isValid2 = await appAuthentication.validateSecondStep(secondStep);

    if (isValid2 != "valid") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isValid2),
        backgroundColor: Colors.red,
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void _onFinal(context, status) {
      Navigator.of(context).pop();
      showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.white.withOpacity(0),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: ParcelFinal(size: size),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    void _OpenParcel(context, SecondStep secondStep, FirstStep firstStep) {
      showDialog(
          barrierColor: Colors.black.withOpacity(0.7),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
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
                            top: kDefaultPadding,
                            bottom: kDefaultPadding),
                        child: Summary(
                          isLoading: isLoading,
                          firstStep: firstStep,
                          secondStep: secondStep,
                          size: size,
                          afterCommand: () async {
                            setState(() {
                              isLoading = true;
                            });
                            var addParcel = await parcelLogic.addParcel(
                                firstStep, secondStep);
                            if (addParcel.success == true) {
                              setState(() {
                                isLoading = false;
                              });
                              _onFinal(context, "true");
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(addParcel.message),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
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
                      component(r_firstname, Iconsax.user, "Firstname", false,
                          false, false),
                      component(r_lastname, Iconsax.user, "Lastname", false,
                          false, false),
                      component(r_address, Iconsax.user, "Receiver's Address",
                          false, false, true),
                      component(r_phone1, Iconsax.user, "Phone number 1", false,
                          false, false),
                      component(r_phone2, Iconsax.user, "Phone number 2", false,
                          false, false),
                      component(
                          r_city, Iconsax.user, "City", false, false, false),
                      StateSelect(size),
                      Container(
                          height: 280.0,
                          margin:
                              const EdgeInsets.only(top: kDefaultPadding / 2),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding / 2),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: blueColor.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 4)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            const SizedBox(height: 10),
                            TitleWithAvartar(
                              text: "Delivery Mode",
                              textSize: 16,
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 20),
                            DeliveryMode(),
                          ])),
                      const SizedBox(height: 20),
                      AppButton(
                        size: size,
                        onpress: () {
                          if (!isLoading) {
                            submitRequest();
                            _OpenParcel(context, secondStep, widget.firstStep);
                          }
                        },
                        text: isLoading ? "processing..." : "Update",
                      ),
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

  Widget component(TextEditingController controller, IconData icon,
      String hintText, bool isPassword, bool isEmail, bool isAddress) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding * 0.3, bottom: kDefaultPadding * 0.3),
      // width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: blueColor.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 4)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
            height: isAddress ? 70 : 40,
            child: TextField(
              controller: controller,
              minLines: isAddress ? 3 : 1,
              maxLines: isAddress ? 5 : 1,
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
      margin: const EdgeInsets.only(
          top: kDefaultPadding * 0.3, bottom: kDefaultPadding * 0.3),
      // width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: blueColor.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 4)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
