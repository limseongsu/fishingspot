import 'dart:convert';
import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:http/http.dart' as http;

class FishingRepository {
  final fishings = <Fishing>[];

  Future api() async {
    var uri = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_public_fshlc_api?serviceKey=yZryteylroOPylwMo3nICWa%2BSGNEuPoH58aijP%2BvG91RjxkJzd0WNLQcfF6O%2FrngdeBEfu75WjauflOu7d4CWQ%3D%3D&pageNo=0&numOfRows=100&type=json');
    var response = await http.get(uri);

    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    final jsonFishing = jsonResult['Fishing'];

    fishings.clear();
    jsonFishing.forEach((e) {
      fishings.add(Fishing.fromJson(e));
    });
  }





// Future<Fishing?> api() async {
//
//   var uri = Uri.parse(
//       'http://api.data.go.kr/openapi/tn_pubr_public_fshlc_api?serviceKey=yZryteylroOPylwMo3nICWa%2BSGNEuPoH58aijP%2BvG91RjxkJzd0WNLQcfF6O%2FrngdeBEfu75WjauflOu7d4CWQ%3D%3D&pageNo=0&numOfRows=100&type=json');
//   var response = await http.get(uri);
//   // Fishing fishing = Fishing.fromJson(json.decode(response.body));
//   Fishing fishing = Fishing.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
//   List<Items> items = fishing.response!.body!.items!;
//   for (var i = 0; i < items.length; i++) {
//     final item = items[i];
//     int km = distance.as(
//         LengthUnit.Kilometer,
//         // LatLng(position.latitude, position.longitude),
//         LatLng(1.2, 1.1),
//         LatLng(double.parse('${item.longitude}'),
//             double.parse('${item.longitude}'))) as int;
//     _ftlist.add(km);
//     _fishing.add(item);
//   }
//   update();
// }
}
