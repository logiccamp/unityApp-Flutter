import 'package:flutter/material.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
  }

  double screenWidth(){
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
}
