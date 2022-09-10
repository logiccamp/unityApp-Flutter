class User {
  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = "";

  User(this.firstname, this.lastname, this.phone, this.address);

  User.fromJson(Map<String, dynamic> json) {
    firstname = json["firstname"];
    lastname = json["lastname"].toString();
    phone = json["phone_number"];
    address =
        json["address"].toString() == "null" ? "" : json["address"].toString();
  }
}
