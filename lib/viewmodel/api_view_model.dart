import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fishingspot/repository/fishing_api.dart';
import 'package:latlong2/latlong.dart';

class ApiViewModel extends GetxController {
  final distance = Distance();
  int selected = 0;
  int _bookmarks = 0;
  List<Items> _fishing = [];
  List fishing1 = [1,2,3];
  List<int> _ftlist = [];

  List<int> get ftlist => _ftlist;

  List<Items> get fishing => _fishing;

  int get bookmarks => _bookmarks;

  void seleted(int index) {
    selected = index;
    update();
  }

  //
  // Future bookMarks(int index) async{
  //   _bookmarks = await index;
  //   update();
  // }
  //

  Future api() async {

    var uri = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_public_fshlc_api?serviceKey=yZryteylroOPylwMo3nICWa%2BSGNEuPoH58aijP%2BvG91RjxkJzd0WNLQcfF6O%2FrngdeBEfu75WjauflOu7d4CWQ%3D%3D&pageNo=0&numOfRows=100&type=json');
    var response = await http.get(uri);
    print("api : ${response}");
    // Fishing fishing = Fishing.fromJson(json.decode(response.body));
    // List<Items> items = fishing.response!.body!.items!;
    // for (var i = 0; i < items.length; i++) {
    //   final item = items[i];
    //   int km = distance.as(
    //       LengthUnit.Kilometer,
    //       // LatLng(position.latitude, position.longitude),
    //       LatLng(1.2, 1.1),
    //       LatLng(double.parse('${item.longitude}'),
    //           double.parse('${item.longitude}'))) as int;
    //   _ftlist.add(km);
    //   _fishing.add(item);
    // }
    // update();
  }
}
