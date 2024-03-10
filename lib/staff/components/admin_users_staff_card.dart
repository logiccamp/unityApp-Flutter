import 'package:flutter/material.dart';

class AdminUserCard extends StatelessWidget {
  const AdminUserCard(
      {Key? key,
      required this.fullname,
      required this.parcelCount,
      required this.user_type,
      required this.viewProfile})
      : super(key: key);

  final String fullname;
  final int parcelCount;
  final String user_type;
  final Function viewProfile;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset("assets/images/user_avatar.png"),
        title: Text(fullname),
        subtitle: user_type == "Users"
            ? Text("Total Parcels : " + parcelCount.toString())
            : const Text("Staff"),
        trailing: InkWell(
            onTap: () {
              viewProfile();
            },
            child: Icon(Icons.more_vert)),
      ),
    );
  }
}
