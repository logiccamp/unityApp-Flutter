import 'package:flutter/material.dart';

class AdminStaffCard extends StatelessWidget {
  const AdminStaffCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with both widgets'),
        subtitle: Column(

        ),
        trailing: InkWell( onTap: () {
        }, child: Icon(Icons.more_vert)),
      ),
    );
  }
}
