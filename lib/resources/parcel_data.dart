class ParcelResponse {
  var tracking_id;
  String updated = "2 hours ago";
  int percent = 75;
  String status = "In transit";

  ParcelResponse(this.tracking_id, this.updated, this.percent, this.status);

  ParcelResponse.fromJson(Map<String, dynamic> json) {
    tracking_id = json["tracking_id"];
    updated = json["last_update"].toString();
    percent = json["progress"];
    status = json["status"].toString();
  }
}
