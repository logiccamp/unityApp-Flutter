import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unitycargo/app/main/mypacel/page_header.dart';
import 'package:unitycargo/app/main/mypacel/title_with_avatar.dart';
import 'package:unitycargo/bll/price_logic.dart';
import 'package:unitycargo/resources/price_list_data.dart';
import 'package:unitycargo/utils/colors.dart';

class PriceList extends StatefulWidget {
  PriceList({Key? key}) : super(key: key);
  @override
  _PriceListState createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  String _state = "Select State";
  Price _price = Price();
  List<PriceListResponse> priceList_ = [];
  var priceList = [];
  @override
  void initState() {
    String _state = "Select State";
    fetchPrices();

    super.initState();
  }

  void fetchPrices() async {
    var response = await _price.Get();
    List<PriceListResponse> priceList_2 = [];
    var parcels = response["data"];
    for (var p in parcels) {
      var pr = PriceListResponse.fromJson(p);
      priceList_2.add(pr);
    }
    setState(() {
      priceList_ = priceList_2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Price List',
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: priceList_.length,
          itemBuilder: (context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
              child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                          color: blueColor.withOpacity(0.3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Title(
                                color: Colors.black,
                                child: Text(
                                  priceList_[index].state.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Title(
                                  color: Colors.black,
                                  child: const Text("MINIMUM WEIGHT")),
                              Title(
                                color: Colors.black,
                                child: Text(
                                  priceList_[index].minimum_weight.toString() +
                                      "KG",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Title(
                                  color: Colors.black,
                                  child: Text("DOOR TO DOOR RATE")),
                              Title(
                                color: Colors.black,
                                child: Text(
                                  "£" + priceList_[index].door_rate.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Title(
                                  color: Colors.black,
                                  child: Text("COLLECTION ONLY RATE")),
                              Title(
                                color: Colors.black,
                                child: Text(
                                  "£" +
                                      priceList_[index]
                                          .collection_rate
                                          .toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
