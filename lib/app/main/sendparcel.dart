import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:date_format/';
import 'package:unitycargo/app/main/mypacel/page_header.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/app/main/sendparcel_recepient.dart';
import 'package:unitycargo/resources/first_step.dart';
import 'package:unitycargo/utils/colors.dart';

import '../../resources/app_authentication.dart';

class SendParcel extends StatefulWidget {
  SendParcel({Key? key}) : super(key: key);
  @override
  _SendParcelState createState() => _SendParcelState();
}

class _SendParcelState extends State<SendParcel> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController noofboxesController = TextEditingController();
  String _commodityType = "Select Commodity Type";
  String _itemType = "Select Package Type";
  TimeOfDay selectedTime = const TimeOfDay(hour: 12, minute: 00);
  DateTime selectedDate = DateTime.now();
  var appAuthentication = AppAuthentication();
  bool isLoading = false;
  List<String> itemsTypes = [
    "Select Package Type",
    "Percel",
    "Document",
    "Box",
    "Pallet"
  ];

  List<String> commodityTypes = [
    "Select Commodity Type",
    "General Cargo",
    "Hazardous Goods",
    "Perishable",
    "AVI",
    "Personal Effects"
  ];

  Future _selectTime(BuildContext context) async {
    // TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      // setState(() {
      selectedTime = picked;
      var h = double.parse(selectedTime.hour.toString());
      var _hour = selectedTime.hour.toString();
      _hour = h < 10 ? '0' + _hour : _hour;
      var _minute = selectedTime.minute.toString();
      var m = double.parse(selectedTime.minute.toString());
      _minute = m < 10 ? '0' + _minute : _minute;

      var _time = _hour + ' : ' + _minute;
      setState(() {
        _timeController.text = _time;
      });

      //   _timeController.text = formatDate(
      //       DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
      //       [hh, ':', nn, " ", am]).toString();
      // // })
    }
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        var _mm = selectedDate.month.toString();
        _mm =
            double.parse(selectedDate.month.toString()) < 10 ? '0' + _mm : _mm;
        var _dd = selectedDate.day.toString();
        _dd = double.parse(selectedDate.day.toString()) < 10 ? '0' + _dd : _dd;
        selectedDate = picked;
        _dateController.text =
            selectedDate.year.toString() + "-" + _mm + "-" + _dd;
        // _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<void> nextPage() async {
    setState(() {
      isLoading = true;
    });

    FirstStep firstStep = FirstStep(
        firstnameController.text,
        lastnameController.text,
        telephoneController.text,
        emailController.text,
        addressController.text,
        postalController.text,
        _dateController.text,
        _timeController.text,
        noofboxesController.text,
        _commodityType,
        _itemType);

    String isValid = await appAuthentication.validateFirstStep(firstStep);

    if (isValid != "valid") {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isValid),
        backgroundColor: Colors.red,
      ));
      return;
    }
    setState(() {
      isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SendParcelRecepient(firstStep: firstStep),
      ),
    );
  }

  @override
  void initState() {
    var _mm = DateTime.now().month.toString();
    var _dd = DateTime.now().day.toString();
    _dd = double.parse(DateTime.now().day.toString()) < 10 ? '0' + _dd : _dd;
    _mm = double.parse(DateTime.now().month.toString()) < 10 ? '0' + _mm : _mm;
    _dateController.text =
        DateTime.now().year.toString() + "-" + _mm + "-" + _dd;

    var _h = TimeOfDay.now().hour.toString();
    _h = double.parse(TimeOfDay.now().hour.toString()) < 10 ? '0' + _h : _h;
    var _m = TimeOfDay.now().minute.toString();
    _m = double.parse(TimeOfDay.now().minute.toString()) < 10 ? '0' + _m : _m;
    _timeController.text = _h + ':' + _m;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            // height: size.height * 0.95 + 110,
            child: Column(
              children: [
                PageHeader(size: size, title: "Send Parcel"),
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(children: [
                      const SizedBox(height: kTopSpacing / 2),
                      const SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      TitleWithAvartar(
                          text: "Item Pickup / Sender Info",
                          textSize: 20,
                          color: Colors.black54),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      component(firstnameController, Iconsax.user, "Firstname",
                          false, false, false),
                      component(lastnameController, Iconsax.user, "Lastname",
                          false, false, false),
                      component(telephoneController, Iconsax.user, "Telephone",
                          false, false, false),
                      component(emailController, Iconsax.user, "Email Address",
                          false, true, false),
                      component(addressController, Iconsax.user,
                          "Pick Up Address", false, false, true),
                      component(postalController, Iconsax.user, "Postal Code",
                          false, false, false),
                      PackageType(size),
                      CommodityType(size),
                      DatePicker(size, context),
                      TimePicker(size, context),
                      component(noofboxesController, Iconsax.user,
                          "No. of Boxes", false, false, false),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          isLoading ? null : nextPage();
                        },
                        child: Container(
                          width: size.width * 0.8,
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2 + 2),
                          decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 0),
                                    spreadRadius: 2,
                                    blurRadius: 20,
                                    blurStyle: BlurStyle.solid,
                                    color: blueColor.withOpacity(0.3))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.save_2,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  isLoading ? "Processing" : 'Proceed',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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

  Container TimePicker(Size size, BuildContext context) {
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
            text: "Pick Up Time",
            textSize: 16,
            color: Colors.black54,
          ),
          InkWell(
            onTap: () {
              _selectTime(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 45,
              child: TextField(
                controller: _timeController,
                enabled: false,
                style: TextStyle(
                  color: Colors.black.withOpacity(.9),
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: blueColor)),
                  hintMaxLines: 1,
                  hintText: _timeController.text,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container DatePicker(Size size, BuildContext context) {
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
            text: "Pick Up Date",
            textSize: 16,
            color: Colors.black54,
          ),
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 45,
              child: TextField(
                controller: _dateController,
                enabled: false,
                style: TextStyle(
                  color: Colors.black.withOpacity(.9),
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: blueColor)),
                  hintMaxLines: 1,
                  hintText: _dateController.text,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container PackageType(Size size) {
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
            text: "Package Type",
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
                value: _itemType,
                hint: Text(_itemType),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _itemType = value.toString();
                  });
                },
                items: itemsTypes.map((String val) {
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

  Container CommodityType(Size size) {
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
            text: "Commodity Type",
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
                value: _commodityType,
                hint: Text(_commodityType),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _commodityType = value.toString();
                  });
                },
                items: commodityTypes.map((String val) {
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
                border: OutlineInputBorder(
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
