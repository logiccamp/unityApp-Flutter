import 'package:flutter/material.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/bll/parcels_logic.dart';

import '../../app/main/mypacel/app_button.dart';
import '../../app/main/mypacel/title_with_avatar.dart';
import '../../utils/colors.dart';
import 'list_textfield_widget.dart';

class DeleteParcelHistory extends StatefulWidget {
  const DeleteParcelHistory({
    Key? key,
    required this.f,
    required this.id,
    required this.report,
  }) : super(key: key);
  final Function f;
  final String id;
  final String report;

  @override
  State<DeleteParcelHistory> createState() => DeleteParcelHistoryState();
}

class DeleteParcelHistoryState extends State<DeleteParcelHistory> {
  final _formKey = GlobalKey<FormState>(); // <-

  @override
  Widget build(BuildContext context) {
    var report = TextEditingController();

    void saveDetails() async {
      widget.f(widget.id);
      Navigator.of(context).pop();
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
                          text: "Delete History",
                          textSize: 16,
                          color: Colors.red,
                          fontweight: FontWeight.normal),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Text(widget.report),
                      Divider(
                        height: 10,
                      ),
                      AppButton(
                          text: "Delete",
                          size: MediaQuery.of(context).size,
                          onpress: () {
                            saveDetails();
                          })
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
