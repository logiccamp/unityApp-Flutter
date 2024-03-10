class PriceListResponse {
  var door_rate;
  var collection_rate;
  var minimum_weight;
  String state = "";

  PriceListResponse(
      this.door_rate, this.collection_rate, this.minimum_weight, this.state);

  PriceListResponse.fromJson(Map<String, dynamic> json) {
    door_rate = json["door_rate"];
    collection_rate = json["collection_rate"].toString();
    minimum_weight = json["minimum_weight"];
    state = json["state"].toString();
  }
}
