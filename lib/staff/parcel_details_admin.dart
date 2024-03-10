import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/bll/admin/users.dart';
import 'package:unitycargo/bll/sendmail.dart';
import 'package:unitycargo/resources/mail_data.dart';
import 'package:unitycargo/resources/parcel_data.dart';
import 'package:unitycargo/resources/user_data.dart';
import 'package:unitycargo/staff/components/parcel_history.dart';
import 'package:unitycargo/staff/components/send_message.dart';
import 'package:unitycargo/staff/customers_staff_profile.dart';
import 'package:unitycargo/utils/extensions.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../bll/parcels_logic.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import '../app/main/mypacel/parcel_status.dart';
import '../app/main/mypacel/title_with_avatar.dart';
import 'components/delete_parcel_history.dart';

class AdminParcelDetails extends StatefulWidget {
  AdminParcelDetails({
    Key? key,
    required this.trackingNumber,
  }) : super(key: key);

  final String trackingNumber;

  @override
  State<AdminParcelDetails> createState() => _AdminParcelDetailsState();
}

class _AdminParcelDetailsState extends State<AdminParcelDetails> {
  bool isLoading = true;
  bool parcelLoading = false;
  Parcel parcelLogic = Parcel();
  var userClass = UsersClass();
  var message = TextEditingController();
  var subject = TextEditingController();
  var mailButtonText = "Send Message";
  bool isParcel = false;
  var utils = Utils();
  var Parcel_;
  User rider = User("", "", "", "");

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    message.dispose();
    subject.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    isLoading = true;
    isParcel = false;
    mailButtonText = "Send Message";
    super.initState();
    getParcel();
  }

  getParcel() async {
    var response = await parcelLogic.GetParcel(widget.trackingNumber);
    Timer(const Duration(seconds: 2), () {
      if (response["success"] == false) {
        setState(() {
          isParcel = false;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          isParcel = true;
          Parcel_ = response["data"];
          if (Parcel_["driver_id"] != "") {
            rider = User.fromJson(Parcel_["rider"]);
          }
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final parentWidth =
        size.width - (kDefaultPadding * 2 + (kDefaultPadding / 2 * 2));

    void addDriver() {}
    void deleteParcel(id, report) {
      showDialog(
          context: context,
          builder: (context) {
            return DeleteParcelHistory(
              id: id,
              report: report,
              f: (report) async {
                setState(() {
                  isLoading = true;
                });
                var response = await parcelLogic.deleteHistory(id);
                if (response["success"] == true) {}

                getParcel();
              },
            );
          });
    }

    void addHistory() {
      showDialog(
          context: context,
          builder: (context) {
            return NewParcelHistory(
              setLoading: (status) => setState(() => isLoading = status),
              isLoading: isLoading,
              t: widget.trackingNumber,
              f: (report) async {
                setState(() {
                  isLoading = true;
                });
                var response =
                    await parcelLogic.addHistory(report, widget.trackingNumber);
                if (response["success"] == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("History Added Successfully"),
                    backgroundColor: Colors.green,
                  ));
                }

                getParcel();
              },
            );
          });
    }

    void sendMail(email, mailbuttonText) {
      showDialog(
          context: context,
          builder: (context) {
            return Material(
              color: Colors.black.withOpacity(0.2),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
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
                                  text: "Send Mail - $email",
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
                                maxLines: 1,
                                controller: subject,
                                decoration:
                                    const InputDecoration(hintText: "Subject"),
                              ),
                              const Divider(
                                height: 10,
                              ),
                              TextField(
                                maxLines: 6,
                                controller: message,
                                decoration: const InputDecoration(
                                    hintText: "Type here"),
                              ),
                              Divider(
                                height: 10,
                              ),
                              AppButton(
                                  text: mailbuttonText,
                                  size: MediaQuery.of(context).size,
                                  onpress: isLoading
                                      ? () {}
                                      : () async {
                                          if (isLoading) return;
                                          setState(() {
                                            isLoading = true;
                                            mailbuttonText = "Processing";
                                          });
                                          var mail = Mail(subject.text,
                                              message.text, email);
                                          bool mailSent =
                                              await SendMail().Send(mail);
                                          print(mailSent);
                                          if (mailSent) {
                                            subject.text = "";
                                            message.text = "";
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                    "Mail Sent Successfully",
                                                  ),
                                                  backgroundColor:
                                                      Colors.green),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Unable to send mail",
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                          setState(() {
                                            isLoading = false;
                                            mailbuttonText = "Send Message";
                                          });
                                          Navigator.of(context).pop();
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
          });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Parcel Details"),
        ),
        body: SingleChildScrollView(
          child: isLoading
              ? SizedBox(
                  height: size.height * 0.8,
                  child: Center(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                              backgroundColor: blueColor,
                            ),
                            Text("Processing...",
                                style: TextStyle(fontSize: 16)),
                          ]),
                    ),
                  ))
              : Padding(
                  padding: const EdgeInsets.fromLTRB(kDefaultPadding,
                      kDefaultPadding / 2, kDefaultPadding, kDefaultPadding),
                  child: isParcel
                      ? Column(children: [
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  sendMail(Parcel_["email"].toString(),
                                      mailButtonText);
                                },
                                child: Icon(
                                  Icons.call_outlined,
                                  color: blueColor,
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  sendMail(Parcel_["email"].toString(),
                                      mailButtonText);
                                },
                                child:
                                    Icon(Icons.mail_outline, color: blueColor),
                              ),
                              Container(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  addHistory();
                                },
                                child: Icon(
                                  Icons.add,
                                  color: blueColor,
                                ),
                              ),
                              const Spacer(),
                              Parcel_["driver_id"].toString() == ""
                                  ? InkWell(
                                      onTap: () {
                                        addDriver();
                                      },
                                      child: Text("Assign Driver"),
                                    )
                                  : InkWell(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => UserProfile(
                                                  id: rider.id,
                                                  user_type: "Staff"))),
                                      child: Text(
                                          "Driver : ${rider.firstname} ${rider.lastname}"),
                                    ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          ParcelStatus(
                              status: Parcel_["status"].toString().capitalize(),
                              updatedAt: Parcel_["last_update"].toString(),
                              trackingNumber: widget.trackingNumber,
                              parentWidth: parentWidth,
                              percent:
                                  double.parse(Parcel_["progress"].toString()) /
                                      100,
                              hideIcon: true),
                          Image.asset(
                            "assets/images/in_transit.png",
                            height: 300.0,
                          ),
                          // sender info
                          Column(children: [
                            TitleWithAvartar(
                              text: "Sender's Info",
                              textSize: 18,
                              color: Colors.black,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["first_name"].toString() +
                                  " " +
                                  Parcel_["last_name"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["phone_number"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["email"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["collection_address"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["postal_code"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                          ]),
                          SizedBox(
                            height: 25,
                          ),
                          Column(children: [
                            TitleWithAvartar(
                              text: "Receiver's Info",
                              textSize: 18,
                              color: Colors.black,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["receiver_first_name"].toString() +
                                  " " +
                                  Parcel_["receiver_last_name"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["receiver_address"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "City: " +
                                  Parcel_["receiver_city"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "State : " +
                                  Parcel_["receiver_state"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: Parcel_["receiver_phone_number2"]
                                          .toString() ==
                                      ""
                                  ? "Telephone : ${Parcel_["receiver_phone_number"].toString()}"
                                  : "Telephone : ${Parcel_["receiver_phone_number"].toString()} and ${Parcel_["receiver_phone_number2"].toString()}",
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                          ]),
                          const SizedBox(
                            height: 25,
                          ),
                          Column(children: [
                            TitleWithAvartar(
                              text: "Package",
                              textSize: 20,
                              color: Colors.black,
                            ),
                            TitleWithAvartar(
                              text: "Package type: " +
                                  Parcel_["package_type"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Commodity type : " +
                                  Parcel_["commodity_type"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Pickup Date :" +
                                  Parcel_["collection_date"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Pickup Time : " +
                                  Parcel_["collection_time"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "No. of Boxes : " +
                                  Parcel_["number_of_boxes"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Weight (KG) : " +
                                  Parcel_["estimated_weight"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Delivery Type" +
                                  Parcel_["delivery_type"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Payment Type" +
                                  Parcel_["payment_type"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                            TitleWithAvartar(
                              text: "Description : " +
                                  Parcel_["item_description"].toString(),
                              textSize: 16,
                              color: Colors.black,
                              fontweight: FontWeight.w400,
                            ),
                          ]),

                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding),
                            child: const Divider(
                              thickness: 3.0,
                            ),
                          ),
                          TitleWithAvartar(
                            text: "History",
                            textSize: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          SizedBox(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Parcel_["history"].length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () => deleteParcel(
                                      Parcel_["history"][index]["id"]
                                          .toString(),
                                      Parcel_["history"][index]["report"]
                                          .toString()),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: kDefaultPadding / 2),
                                            child: Image.asset(
                                              "assets/images/in_transit_circle.png",
                                              height: 54,
                                            ),
                                          ),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TitleWithAvartar(
                                                  color: Colors.black,
                                                  text: Parcel_["history"]
                                                          [index]["report"]
                                                      .toString(),
                                                  textSize: 20),
                                              TitleWithAvartar(
                                                  color: Colors.black45,
                                                  fontweight: FontWeight.normal,
                                                  text: utils
                                                      .diffForHumans(
                                                          Parcel_["history"]
                                                                  [index]
                                                              ["created_at"])
                                                      .toString()
                                                      .toString(),
                                                  textSize: 16),
                                            ],
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding),
                            child: AppButton(
                              size: size,
                              onpress: () {
                                addHistory();
                              },
                              text: "Add History",
                              hasIcon: false,
                            ),
                          ),
                        ])
                      : SizedBox(
                          height: size.height * 0.8,
                          child: Center(
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/notfound.jpg",
                                      height: 180,
                                      width: double.maxFinite,
                                      fit: BoxFit.contain,
                                    ),
                                    const Text(
                                        "Invalid Tracking No., please try again.",
                                        style: TextStyle(fontSize: 18)),
                                  ]),
                            ),
                          ),
                        ),
                ),
        ));
  }
}
