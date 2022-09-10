class LocationResponse {
  var name;
  var address;
  var telephone;
  var contact_person;

  LocationResponse(
      this.name, this.address, this.telephone, this.contact_person);

  LocationResponse.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    address = json["address"].toString();
    telephone = json["telephone"];
    contact_person = json["contact_person"].toString();
  }
}
