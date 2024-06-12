import 'package:flutter/material.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/resources/user_data_parcel.dart';

import '../../app/main/mypacel/app_button.dart';
import '../../app/main/mypacel/title_with_avatar.dart';
import '../../utils/colors.dart';

class ParcelDriver extends StatefulWidget {
  const ParcelDriver(
      {Key? key,
      required this.f,
      required this.t,
      required this.isLoading,
      required this.setLoading,
      required this.riders})
      : super(key: key);
  final Function f;
  final String t;
  final bool isLoading;
  final Function setLoading;
  final List<UserParcelData> riders;

  @override
  State<ParcelDriver> createState() => _ParcelDriverState();
}

class _ParcelDriverState extends State<ParcelDriver> {
  String statusController = "Select";
  String selectedRider = "";
  @override
  Widget build(BuildContext context) {
    void saveDetails() async {
      if (statusController == "" || statusController == 'Select') {
        Navigator.of(context).pop();
      } else {
        Navigator.pop(context);

        widget.f(selectedRider);
      }
    }

    void setStatus(role) {
      setState(() {
        statusController = role;
      });
    }

    void setRiderId(id) {
      setState(() {
        selectedRider = id;
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
                          text: "Add or Change Rider - ${widget.t}",
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
                                  title: const Text("Select Rider"),
                                  content: Container(
                                    height: 200,
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: widget.riders.isEmpty
                                        ? const Text("No riders found")
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: widget.riders.length,
                                            itemBuilder: (context, int index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(context);
                                                  setStatus(
                                                      "${widget.riders[index].firstname} ${widget.riders[index].lastname}");
                                                  setRiderId(
                                                      widget.riders[index].id);
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "${widget.riders[index].firstname} ${widget.riders[index].lastname}"),
                                                    const Divider(),
                                                  ],
                                                ),
                                              );
                                            }),
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
                      const Divider(
                        height: 10,
                      ),
                      AppButton(
                          text: widget.isLoading ? "Processing..." : "Change",
                          textSize: 14,
                          size: MediaQuery.of(context).size,
                          onpress: () {
                            saveDetails();
                          }),
                      const SizedBox(
                        height: 14,
                      ),
                      InkWell(
                        child: const Text(
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
