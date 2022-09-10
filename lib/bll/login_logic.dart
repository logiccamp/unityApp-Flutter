import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../resources/response_data.dart';
import '../utils/app_urls.dart';

Future<ResponseData> login(String email, String password) async {
  try {
    var response = await http.post(
      Uri.parse(url + "login"),
      body: ({"email": email, "password": password}),
      headers: {"accept": "application/json"},
    );
    var res = json.decode(response.body);
    if (response.statusCode > 201) {
      return ResponseData(false, res["error"], "");
    }
    return ResponseData(true, res["data"]["message"], res["data"]["token"]);
  } catch (e) {
    print(e);
    return ResponseData(false, "An error occur", "");
  }
}
