import 'package:flutter/material.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/bll/parcels_logic.dart';

import '../../app/main/mypacel/app_button.dart';
import '../../app/main/mypacel/title_with_avatar.dart';
import '../../utils/colors.dart';
import 'list_textfield_widget.dart';

class ParcelStatusUpdate extends StatefulWidget {
  const ParcelStatusUpdate({
    Key? key,
    required this.f,
    required this.t,
    required this.isLoading,
    required this.setLoading,
  }) : super(key: key);
  final Function f;
  final String t;
  final bool isLoading;
  final Function setLoading;

  @override
  State<ParcelStatusUpdate> createState() => _ParcelStatusUpdateState();
}

class _ParcelStatusUpdateState extends State<ParcelStatusUpdate> {
  final _formKey = GlobalKey<FormState>(); // <-
  String statusController = "Select";
  List allStatus = [
    "Pending",
    "Accepted",
    "In transit",
    "Delivered",
    "Cancelled"
  ];
  @override
  Widget build(BuildContext context) {
    var report = TextEditingController();

    void saveDetails() async {
      if (statusController == "" || statusController == 'Select') {
        Navigator.of(context).pop();
      } else {
        Navigator.pop(context);
        widget.f(statusController.toLowerCase());
      }
    }

    void setStatus(role) {
      setState(() {
        statusController = role;
      });
    }

    return Material(
      color: Colors.black.withOpacity(0.2),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: blueColor.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      )
                    ]),
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      TitleWithAvartar(
                          text: "Update Status - ${widget.t}",
                          textSize: 16,
                          color: Colors.black,
                          fontweight: FontWeight.normal),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: const Text("Select Status"),
                                  content: Container(
                                    height: 240,
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(context);
                                            setStatus("Pending");
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: const Text(
                                              "Pending",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(context);
                                            setStatus("In transit");
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: const Text(
                                              "In transit",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(context);
                                            setStatus("Delivered");
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: const Text(
                                              "Delivered",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(context);
                                            setStatus("Accepted");
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: const Text(
                                              "Accepted",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(context);
                                            setStatus("Cancelled");
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: const Text(
                                              "Cancelled",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop(context);
                                        },
                                        child: const Text("close"),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: ListTile(
                          leading: const Icon(Icons.work_outline),
                          title: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                statusController,
                                style: TextStyle(
                                    color: statusController == "Select"
                                        ? Colors.black.withOpacity(0.5)
                                        : Colors.black),
                              )),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                      ),
                      AppButton(
                          text: widget.isLoading ? "Processing..." : "Update",
                          size: MediaQuery.of(context).size,
                          onpress: () {
                            saveDetails();
                          }),
                      SizedBox(
                        height: 14,
                      ),
                      InkWell(
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
