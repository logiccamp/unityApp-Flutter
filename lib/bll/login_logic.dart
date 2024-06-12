import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unitycargo/resources/app_authentication.dart';
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
      return ResponseData(false, res["error"], "", "");
    }
    var responseData = ResponseData(true, res["data"]["message"],
        res["data"]["token"], res["data"]["role"]);

    return responseData;
  } catch (e) {
    return ResponseData(false, "An error occur", "", "");
  }
}

Future<String> deleteAccount() async {
  try {
    var appAuthentication = AppAuthentication();

    String token = await appAuthentication.getToken();
    String path = url + "delete-account";
    var response = await http.get(Uri.parse(path), headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });

    if (response.statusCode > 201) {
      return "We are unable to delete your account at the moment";
    }
    return "success";
  } catch (e) {
    return "We are unable to delete your account at the moment";
  }
}
