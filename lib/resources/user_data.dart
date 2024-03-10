import 'package:unitycargo/resources/parcel_data.dart';

class User {
  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = "";
  String role = "";
  String email = "";
  String id = "";
  List<ParcelResponse> Parcels = [];
  User(this.firstname, this.lastname, this.phone, this.address);

  User.fromJson(Map<String, dynamic> json) {
    try {
      var parcels = json["parcels"];
      for (var p in parcels) {
        Parcels.add(ParcelResponse.fromJson(p));
      }
    } catch (e) {
      print(e);
    }
    firstname = json["firstname"];
    lastname = json["lastname"].toString();
    phone = json["phone_number"];
    role = json["role"];
    email = json["email"];
    id = json["id"].toString();
    address =
        json["address"].toString() == "null" ? "" : json["address"].toString();
  }
}
