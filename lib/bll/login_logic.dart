import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/app_urls.dart';

Future login(String email, String password) async {
  try {
    var response = await http.post(
      Uri.parse(url + "login/"),
      body: ({"email": email, "password": password}),
      headers: {"accept": "application/json"},
    );
    var res = json.decode(response.body);
    if (res["status"] == true) {
      return "success";
    }
    if (res["status"] == false) {
      return res["message"];
    }

    return "All fields are required";
  } catch (e) {
    return e.toString();
  }
}
