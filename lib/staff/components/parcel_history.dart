import 'package:flutter/material.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/bll/parcels_logic.dart';

import '../../app/main/mypacel/app_button.dart';
import '../../app/main/mypacel/title_with_avatar.dart';
import '../../utils/colors.dart';
import 'list_textfield_widget.dart';

class NewParcelHistory extends StatefulWidget {
  const NewParcelHistory({
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
  State<NewParcelHistory> createState() => _NewParcelHistoryState();
}

class _NewParcelHistoryState extends State<NewParcelHistory> {
  final _formKey = GlobalKey<FormState>(); // <-

  @override
  Widget build(BuildContext context) {
    var report = TextEditingController();

    void saveDetails() async {
      if (report.text == "") return;

      widget.f(report.text);
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
                          text: "Add History - ${widget.t}",
                          textSize: 16,
                          color: Colors.black,
                          fontweight: FontWeight.normal),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 10,
                      ),
                      TextField(
                        key: _formKey,
                        maxLines: 1,
                        onChanged: (value) => report.text = value,
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: "Type here"),
                      ),
                      Divider(
                        height: 10,
                      ),
                      AppButton(
                          text: widget.isLoading ? "Processing..." : "Add",
                          size: MediaQuery.of(context).size,
                          onpress: () {
                            widget.isLoading ? () {} : saveDetails();
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
