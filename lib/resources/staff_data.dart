import 'package:unitycargo/resources/parcel_data.dart';

class Staff {
  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = "";
  String email = "";
  String post = "";
  String password = "";
  String id = "";
  Staff(this.firstname, this.lastname, this.phone, this.address, this.email,
      this.password, this.post);

  Staff.fromJson(Map<String, dynamic> json) {
    firstname = json["firstname"];
    lastname = json["lastname"].toString();
    phone = json["phone_number"];
    post = json["post"];
    email = json["email"];
    id = json["id"].toString();
    address =
        json["address"].toString() == "null" ? "" : json["address"].toString();
  }
}
