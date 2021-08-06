class Place {
  String? title;
  String? type;
  String? address;
  String? price;
  String? fish;
  String? nums;
  String? structure;
  double? lat;
  double? lon;
  num? km;

  Place(this.title, this.type, this.address, this.price, this.fish, this.nums,
      this.structure,this.lat,this.lon);




  //TODO 나중에 api 받을 때 핸들링 할 부분
  Place.fromJson(dynamic json) {
    title = json["fshlcNm"];
    type = json["fshlcType"];
    address = json["rdnmadr"];
    price = json["useCharge"];
    fish = json["kdfsh"];
    nums = json["fshlcPhoneNumber"];
    structure = json["wtrcFcltyType"];
    lat = json["latitude"].toDouble();
    lon = json["longitude"].toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["fshlcNm"] = title;
    map["fshlcType"] = type;
    map["rdnmadr"] = address;
    map["useCharge"] = price;
    map["kdfsh"] = fish;
    map["fshlcPhoneNumber"] = nums;
    map["wtrcFcltyType"] = structure;
    map["latitude"] = lat ;
    map["longitude"] = lon ;
    return map;
  }
}
