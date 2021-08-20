import 'package:fishingspot/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:get_storage/get_storage.dart';


class ApiViewModel extends GetxController {
  final _locationRepository = LocationRepository();
  final distance = Distance();
  final data = GetStorage();

  int selected = 0;
  List<Items> _fishing = [];

  List<Items> get fishing => _fishing;
  bool isLoading = true;

  RxMap<String, bool> bookMarks = <String, bool>{}.obs;

  ApiViewModel(){
    bookMarks = RxMap<String, bool>.from(Map.from(data.read('bookmarks') ?? <String, bool>{}));
  }

  List<Items> get favoriteFishing {
    return _fishing.where((e) => bookMarks[e.fshlcNm] ?? false).toList();
  }
  void bookMark(String name) {
    final currentFavorite = bookMarks[name] ?? false;
    bookMarks[name] = !currentFavorite;
    data.write('bookmarks', bookMarks);
  }


  void seleted(int index) {
    selected = index;
    update();
  }
  //모델부분
  Future<List<Items>> api({Position? position}) async {
    if (position == null) {
      position = await _locationRepository.getCurrentLocation();
    }
    var uri = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_public_fshlc_api?serviceKey=yZryteylroOPylwMo3nICWa%2BSGNEuPoH58aijP%2BvG91RjxkJzd0WNLQcfF6O%2FrngdeBEfu75WjauflOu7d4CWQ%3D%3D&pageNo=0&numOfRows=100&type=json');
    var response = await http.get(uri);
    Fishing fishing = Fishing.fromJson(json.decode(response.body));
    _fishing = fishing.response!.body!.items!;
    _fishing.forEach((Items item) {
      final meter = distance.as(
          LengthUnit.Meter,
          LatLng(position!.latitude, position.longitude),
          LatLng(double.parse('${item.latitude ?? 0}'),
              double.parse('${item.longitude ?? 0}')));
        item.meter = meter;
    });
      _fishing.sort((a, b) => a.meter!.compareTo(b.meter!));

    return _fishing;
  }

}
