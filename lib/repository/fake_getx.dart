import 'package:fishingspot/data/model/place_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class FakeGet extends GetxController {
  final List<Place> items = [
    Place('2박3일', '저수지', '강원도', '1만원', '붕어', '031000000', '가판형',"36.611772",'126.820533'),
    Place('낚시좋아', '바다', '경기도', '2만원', '감성돔', '032000000', '부유형','36.611772','126.820533'),
    Place('널낚시', '민물', '전라남도', '3만원', '향어+붕어', '033000000', '좌대','36.611772','126.820533'),
    Place('바다에요', '저수지', '제주도', '4만원', '베스', '034000000', '수상좌대','36.611772','126.820533'),
    Place('수지는저수지', '저수지', '충청도', '5만원', '블루길', '035000000', '가옥형','36.611772','126.820533'),
  ];

  @override
  Future add(Place item) async {
    await Future.delayed(Duration(milliseconds: 10));
    //서버 통신
    items.add(Place(item.title, item.type, item.address, item.price, item.fish,
        item.num, item.structure, item.lat,item.lon));
  }

  @override
  Future<List<Place>> getAll() async {
    await Future.delayed(Duration(seconds: 1));

    return items;
  }

  int selected = 0;

  void select(int index) {
    selected = index;
    update();
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    update();
    return position;
  }

}




