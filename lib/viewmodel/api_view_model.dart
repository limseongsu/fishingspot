import 'package:fishingspot/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:latlong2/latlong.dart';

class ApiViewModel extends GetxController {
  final _locationRepository = LocationRepository();
  final distance = Distance();
  int selected = 0;
  late Set _bookMarks;
  List<Items> _fishing = [];
  Position? position;
  bool isLoading = true;

  List<Items> get fishing => _fishing;

  Set get bookMarks => _bookMarks;

  // List<num> _ftlist = [];
  //
  // List<num> get ftlist => _ftlist;



  ApiViewModel() {
    api();
    current();
    update();
  }

  void bookMark(int index)  {
    if(_bookMarks.contains(index)){
      _bookMarks.remove(index);
    }else {
      _bookMarks.add(index);
    }
    update();
  }

  Future<Position?> current() async {
    position = await _locationRepository.getCurrentLocation();
    isLoading = false;
    update();
    return position;
  }


  void seleted(int index) {
    selected = index;
    update();
  }

  Future<List<Items>> api() async {
    var uri = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_public_fshlc_api?serviceKey=yZryteylroOPylwMo3nICWa%2BSGNEuPoH58aijP%2BvG91RjxkJzd0WNLQcfF6O%2FrngdeBEfu75WjauflOu7d4CWQ%3D%3D&pageNo=0&numOfRows=100&type=json');
    var response = await http.get(uri);
    Fishing fishing = Fishing.fromJson(json.decode(response.body));
    final jsonFishing = fishing.response!.body!.items!;
    jsonFishing.forEach((Items item) {
    //   final km = distance.as(
    //       LengthUnit.Kilometer,
    //       LatLng(position!.latitude, position!.longitude),
    //       LatLng(double.parse('${item.longitude ?? 0}'),
    //           double.parse('${item.longitude ?? 0}')));
    //   if(km <5){
        _fishing.add(item);
      }
      // _fishing.add(item);
    );
    return _fishing;
  }

}
