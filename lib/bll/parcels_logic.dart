import 'dart:convert';

import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/first_step.dart';
import 'package:unitycargo/resources/parcel_data.dart';
import 'package:unitycargo/resources/second_step.dart';
import 'package:unitycargo/utils/app_urls.dart';
import 'package:http/http.dart' as http;

import '../resources/response_data.dart';

class Parcel {
  var appAuthentication = AppAuthentication();

  Future MyParcels(limit) async {
    try {
      String path = url + "item-pickup?limit=";
      if (limit > 0) {
        path = path + limit.toString();
      }
      String token = await appAuthentication.getToken();
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

  Future GetParcel(id) async {
    String path = url + "item-pickup/" + id;
    String token = await appAuthentication.getToken();
    var response = await http.get(Uri.parse(path), headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future<ResponseData> addParcel(
      FirstStep firstStep, SecondStep secondStep) async {
    String path = url + "item-pickup";
    String token = await appAuthentication.getToken();
    var data = {
      "first_name": firstStep.firstname,
      "last_name": firstStep.lastname,
      "email": firstStep.email,
      "phone_number": firstStep.telephone,
      "collection_address": firstStep.address,
      "postal_code": firstStep.postal,
      "package_type": firstStep.itemType,
      "commodity_type": firstStep.commodityType,
      "collection_date": firstStep.date,
      "collection_time": firstStep.time,
      "item_description": "Item description",
      "estimated_weight": "1",
      "number_of_boxes": firstStep.noofboxes,
      "receiver_first_name": secondStep.firstname,
      "receiver_last_name": secondStep.lastname,
      "receiver_address": secondStep.address,
      "receiver_city": secondStep.city,
      "receiver_state": secondStep.state,
      "receiver_phone_number": secondStep.phone1,
      "receiver_phone_number2": secondStep.phone2,
      "delivery_type": secondStep.deliveryMode,
      "payment_type": "Offline",
    };

    try {
      var response = await http.post(
        Uri.parse(path),
        body: (data),
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer " + token,
          "token": token,
        },
      );
      var res = json.decode(response.body);
      if (response.statusCode > 201) {
        return ResponseData(false, res["error"], "");
      } else {
        return ResponseData(true, res["message"], "");
      }
    } catch (e) {
      return ResponseData(false, e.toString(), "");
    }
  }
}
