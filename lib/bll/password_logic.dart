import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/response_data.dart';
import 'package:unitycargo/resources/user_data.dart';

import 'package:http/http.dart' as http;
import 'package:unitycargo/utils/app_urls.dart';
import 'dart:convert';

class PasswordLogic {
  Future forgotPassword(email) async {
    String path = url + "forgot-password";
    var data = {"email": email};
    var response = await http.post(Uri.parse(path),
        headers: {
          "accept": "application/json",
        },
        body: data);

    var res = json.decode(response.body);
    return res;
    //return ResponseData(res["status"], res["message"], "", "");
  }

  Future<ResponseData> resetPassword(
      email, token, password, newPassword) async {
    String path = url + "reset-password";
    var data = {
      "email": email,
      "otp": token,
      "password": password,
      "password_confirmation": newPassword,
    };
    var response = await http.post(Uri.parse(path),
        headers: {
          "accept": "application/json",
        },
        body: data);

    var res = json.decode(response.body);
    print(res);
    return ResponseData(res["success"], res["message"], "", "");
  }
}
