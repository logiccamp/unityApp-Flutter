import 'dart:convert';

import 'package:unitycargo/utils/app_urls.dart';
import 'package:http/http.dart' as http;
import '../resources/app_authentication.dart';
import '../resources/response_data.dart';

class LocationLogic {
  Future Get() async {
    var appAuathentication = AppAuthentication();
    try {
      String path = url + "location-lists";

      String token = await appAuathentication.getToken();
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
}
