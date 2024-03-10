import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({Key? key, required this.size}) : super(key: key);
  var size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      Text("Processing...", style: TextStyle(fontSize: 16)),
                    ]),
              ),
            ));
  }
}