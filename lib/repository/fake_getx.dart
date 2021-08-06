import 'dart:convert';
import 'package:fishingspot/data/model/place_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class FakeGet extends GetxController {

  // final List<Place> items = [
  //   Place('2박3일', '저수지', '강원도', '1만원', '붕어', '031000000', '가판형',36.611772,126.820533),
  //   Place('낚시좋아', '바다', '경기도', '2만원', '감성돔', '032000000', '부유형',36.611772,126.820533),
  //   Place('널낚시', '민물', '전라남도', '3만원', '향어+붕어', '033000000', '좌대',36.611772,126.820533),
  //   Place('바다에요', '저수지', '제주도', '4만원', '베스', '034000000', '수상좌대',36.611772,126.820533),
  //   Place('수지는저수지', '저수지', '충청도', '5만원', '블루길', '035000000', '가옥형',36.611772,126.820533),
  // ];

  final
  List<String> title = ['2박3일','낚시좋아','널낚시','바다에요','수지는저수지'];
  List<String> type = ['저수지','바다','민물','저수지','바다'];
  List<String> address = ['강원도','경기도','전라남도','제주도', '충청도'];
  List<String> price = ['1만원','2만원','3만원','4만원','5만원'];
  List<String> fish = ['붕어','감성돔','향어+붕어','베스','블루길'];
  List<String> nums = ['031000000','031300000','131000000','031000002','031000001'];
  List<String> structure = ['가판형','부유형','좌대','수상좌대','가옥형',];
  List<double> lat = [33.611772,34.611772,36.611772,36.611772,36.611772];
  List<double> lon = [126.820533,126.820533,126.820533,126.820533,126.820533];

  List<Map<String, dynamic>> location = [
      {
  'title' : '2박3일',

      }
  ];

  var json = jsonEncode(location)






  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    update();
    return position;
  }
}




