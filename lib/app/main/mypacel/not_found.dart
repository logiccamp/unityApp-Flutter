import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  NotFound({Key? key, required this.size, required this.message})
      : super(key: key);
  var size;
  var message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Center(
        child: SizedBox(
          height: 220,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/notfound.jpg",
                  height: 180,
                  width: double.maxFinite,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(message, style: TextStyle(fontSize: 18)),
                ),
              ]),
        ),
      ),
    );
  }
}
