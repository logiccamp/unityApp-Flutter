class ParcelRider {
  String firstname = "";
  String lastname = "";
  String id = "";
  ParcelRider(
    this.firstname,
    this.lastname,
  );

  ParcelRider.fromJson(Map<String, dynamic> json) {
    firstname = json["firstname"];
    lastname = json["lastname"].toString();
    id = json["id"].toString();
  }
}
