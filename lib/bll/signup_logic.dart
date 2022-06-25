import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/app_urls.dart';

Future signup(String email, String password, String firstname, String lastname,
    String phone) async {
  try {
    var response = await http.post(Uri.parse(url + "signup/"),
        body: ({
          "email": email,
          "password": password,
          "firstname": firstname,
          "lastname": lastname,
          "phone": phone,
          "type": "appuser",
        }),
        headers: {"accept": "application/json"});
    var res = json.decode(response.body);
    if (res == true) {
      return "success";
    }
    if (res == false) {
      return "Something went wrong! Please try again";
    }

    if (res == "email") {
      return "Email address already exist";
    }

    return "All fields are required";
  } catch (e) {
    return print(e.toString());
    return e.toString();
  }
}
