import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/resources/second_step.dart';

import '../../../resources/first_step.dart';
import '../../../utils/colors.dart';
import 'parcel_status.dart';
import 'title_with_avatar.dart';

class Summary extends StatefulWidget {
  Summary({
    Key? key,
    required this.size,
    required this.afterCommand,
    required this.firstStep,
    required this.secondStep,
    required this.isLoading,
  }) : super(key: key);

  final Size size;
  FirstStep firstStep;
  SecondStep secondStep;
  Function afterCommand;
  bool isLoading;

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TitleWithAvartar(
                  text: "Summary",
                  fontweight: FontWeight.w900,
                  textSize: 24,
                  color: Colors.black,
                ),
              ),
              Material(
                color: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.close_sharp),
                  onPressed: () => {Navigator.of(context).pop()},
                  splashRadius: 20,
                ),
              )
            ],
          ),
          Image.asset(
            "assets/images/in_transit.png",
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: blueColor.withOpacity(0.3),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                TitleWithAvartar(
                  text: "Sender",
                  textSize: 20,
                  color: Colors.black,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.firstname +
                      " " +
                      widget.firstStep.lastname,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.telephone,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.email,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.address,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.postal,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: blueColor.withOpacity(0.3),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                TitleWithAvartar(
                  text: "Recepient",
                  textSize: 20,
                  color: Colors.black,
                ),
                TitleWithAvartar(
                  text: widget.secondStep.firstname +
                      " " +
                      widget.secondStep.lastname,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.secondStep.address,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.secondStep.phone1,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                widget.secondStep.phone2 == ""
                    ? Container()
                    : TitleWithAvartar(
                        text: widget.secondStep.phone2,
                        textSize: 16,
                        color: Colors.black,
                        fontweight: FontWeight.w400,
                      ),
                TitleWithAvartar(
                  text: "City : " + widget.secondStep.city,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: "State : " + widget.secondStep.state,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: blueColor.withOpacity(0.3),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                TitleWithAvartar(
                  text: "Package",
                  textSize: 20,
                  color: Colors.black,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.itemType,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: widget.firstStep.commodityType,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: "Pickup Date :" + widget.firstStep.date,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: "Pickup Time : " + widget.firstStep.time,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
                TitleWithAvartar(
                  text: "No. of Boxes : " + widget.firstStep.noofboxes,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: blueColor.withOpacity(0.3),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                TitleWithAvartar(
                  text: "Delivery Mode",
                  textSize: 20,
                  color: Colors.black,
                ),
                TitleWithAvartar(
                  text: widget.secondStep.deliveryMode,
                  textSize: 16,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: AppButton(
                  size: widget.size,
                  text: "Submit Now",
                  onpress: () => {widget.afterCommand()}),
            ),
          )
        ],
      ),
    );
  }
}
