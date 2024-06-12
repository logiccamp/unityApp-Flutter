import 'package:unitycargo/resources/parcel_data.dart';

class UserParcelData {
  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = "";
  String role = "";
  String email = "";
  String post = "";
  String id = "";
  List<ParcelResponse> Parcels = [];
  UserParcelData(this.firstname, this.lastname, this.phone, this.address);

  UserParcelData.fromJson(Map<String, dynamic> json) {
    try {
      var parcels = json["parcels"];
      for (var p in parcels) {
        Parcels.add(ParcelResponse.fromJson(p));
      }
    } catch (e) {}
    firstname = json["firstname"];
    lastname = json["lastname"].toString();
    phone = json["phone_number"];
    role = json["role"];
    post = json["post"];
    email = json["email"];
    id = json["id"].toString();
    address =
        json["address"].toString() == "null" ? "" : json["address"].toString();
  }
}
