import 'package:flutter/material.dart';
import './extensions.dart';
import 'package:timeago/timeago.dart' as timeago;

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
  }

  double screenWidth() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .size
        .width;
  }

  diffForHumans(ddate) {
    var dateCreated = DateTime.parse(ddate);
    final now = new DateTime.now();
    final diff = now.difference(dateCreated);
    return timeago.format(dateCreated);
  }
}
