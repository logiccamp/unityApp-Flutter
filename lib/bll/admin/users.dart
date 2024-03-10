import 'dart:convert';
import 'package:unitycargo/resources/staff_data.dart';
import 'package:unitycargo/resources/user_data.dart';

import '../../resources/app_authentication.dart';
import '../../utils/app_urls.dart';
import '../../resources/user_data.dart';
import 'package:http/http.dart' as http;

class UsersClass {
  Future Get(String type) async {
    var appAuathentication = AppAuthentication();
    try {
      String path = url + "users/" + type;
      String token = await appAuathentication.getTokenAdmin();
      var response = await http.get(Uri.parse(path), headers: {
        "accept": "application/json",
        "Authorization": "Bearer " + token,
        "token": token,
      });
      return json.decode(response.body);
    } catch (e) {
      return "error";
    }
  }

  Future Details() async {
    var appAuathentication = AppAuthentication();
    try {
      String path = url + "user-details";
      String token = await appAuathentication.getTokenAdmin();
      var response = await http.get(Uri.parse(path), headers: {
        "accept": "application/json",
        "Authorization": "Bearer " + token,
        "token": token,
      });

      var res = json.decode(response.body);
      return User.fromJson(res["data"]);
    } catch (e) {
      return "error";
    }
  }

  Future GetUser(id) async {
    var appAuathentication = AppAuthentication();
    try {
      String path = url + "user/" + id;
      String token = await appAuathentication.getTokenAdmin();
      var response = await http.get(Uri.parse(path), headers: {
        "accept": "application/json",
        "Authorization": "Bearer " + token,
        "token": token,
      });

      var res = json.decode(response.body);
      return User.fromJson(res["data"]);
    } catch (e) {
      return "error";
    }
  }

  Future<bool> updateUser(String email, String firstname, String lastname,
      String phone, String address, String id) async {
    bool isSuccess = false;
    var appAuthentication = AppAuthentication();
    String path = url + "update-user/" + id;
    String token = await appAuthentication.getTokenAdmin();
    var data = {
      "firstname": firstname,
      "lastname": lastname,
      "phone_number": phone,
      "address": address,
      "email": email,
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

  Future<String> AddStaff(Staff staff) async {
    String isSuccess = "false";
    var appAuthentication = AppAuthentication();
    String path = url + "add-staff";
    String token = await appAuthentication.getTokenAdmin();
    var data = {
      "firstname": staff.firstname,
      "name": staff.firstname + " " + staff.lastname,
      "lastname": staff.lastname,
      "phone_number": staff.phone,
      "address": staff.address,
      "email": staff.email,
      "post": staff.post,
      "password": staff.password,
    };
    var response = await http.post(Uri.parse(path), body: data, headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    return json.decode(response.body).toString();
  }

  Future filterUser(String type, String value) async {
    String isSuccess = "false";
    var appAuthentication = AppAuthentication();
    String path = url + "filter-user/" + type + "?searchTerm=" + value;
    String token = await appAuthentication.getTokenAdmin();
    var response = await http.get(Uri.parse(path), headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    return json.decode(response.body)["data"];
  }

  Future sendMail(String email, String message, String subject) async {
    String isSuccess = "false";
    var appAuthentication = AppAuthentication();
    String path = url + "send-mail";
    String token = await appAuthentication.getTokenAdmin();
    var data = {
      "email": email,
      "message": message,
      "subject": subject,
    };
    var response = await http.post(Uri.parse(path), body: data, headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    return json.decode(response.body)["data"];
  }
// updateUser
}
