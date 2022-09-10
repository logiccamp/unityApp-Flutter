import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/user_data.dart';

import 'package:http/http.dart' as http;
import 'package:unitycargo/utils/app_urls.dart';
import 'dart:convert';

class ProfileLogic {
  Future<User> getProfile() async {
    var appAuthentication = AppAuthentication();
    String path = url + "user-details";
    String token = await appAuthentication.getToken();
    var response = await http.post(Uri.parse(path), headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });

    var res = json.decode(response.body);
    print(res);
    return User.fromJson(res["data"]);
  }

  Future<bool> updateProfile(User user) async {
    bool isSuccess = false;
    var appAuthentication = AppAuthentication();
    String path = url + "update-user";
    String token = await appAuthentication.getToken();
    var data = {
      "firstname": user.firstname,
      "lastname": user.lastname,
      "phone": user.phone,
      "address": user.address,
    };
    var response = await http.post(Uri.parse(path), body: data, headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    var res = json.decode(response.body);
    if (res == true) {
      isSuccess = true;
    }
    return isSuccess;
  }

  Future<bool> updatePassword(old, new_, confirm) async {
    bool isSuccess = false;
    var appAuthentication = AppAuthentication();
    String path = url + "update-password";
    String token = await appAuthentication.getToken();
    var data = {
      "password": new_,
      "password_confirmation": confirm,
      "old_password": old
    };
    var response = await http.post(Uri.parse(path), body: data, headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    var res = json.decode(response.body);
    if (res == true) {
      isSuccess = true;
    }
    return isSuccess;
  }
}
