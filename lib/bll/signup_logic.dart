import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/app_urls.dart';

Future signup(String email, String password, String firstname, String lastname,
    String phone) async {
  String path = url + "register";
  try {
    var data = {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "phone_number": phone,
      "type": "appuser",
    };
    var response = await http.post(Uri.parse(path),
        body: (data), headers: {"accept": "application/json"});
    var res = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 401) {
      return "One or more input is invalid";
    }

    if (res == "email") {
      return "Email has been taken";
    }

    if (res == "phone") {
      return "Phone number already exist";
    }

    if (res["data"]["status"]) {
      return "success";
    }
  } catch (e) {
    return e.toString();
  }
}
