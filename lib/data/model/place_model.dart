class Place {
  String? title;
  String? type;
  String? address;
  String? price;
  String? fish;
  String? num;
  String? structure;
  String? lat;
  String? lon;

  Place(this.title, this.type, this.address, this.price, this.fish, this.num,
      this.structure,this.lat,this.lon);

  Place.fromJson(dynamic json) {
    title = json["fshlcNm"];
    type = json["fshlcType"];
    address = json["rdnmadr"];
    price = json["useCharge"];
    fish = json["kdfsh"];
    num = json["fshlcPhoneNumber"];
    structure = json["wtrcFcltyType"];
    lat = json["latitude"];
    lon = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["fshlcNm"] = title;
    map["fshlcType"] = type;
    map["rdnmadr"] = address;
    map["useCharge"] = price;
    map["kdfsh"] = fish;
    map["fshlcPhoneNumber"] = num;
    map["wtrcFcltyType"] = structure;
    map["latitude"] = lat as double;
    map["longitude"] = lon as double;
    return map;
  }
}
