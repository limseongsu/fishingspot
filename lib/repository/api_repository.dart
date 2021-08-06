import 'package:fishingspot/data/model/place_model.dart';
import 'package:get/get.dart';

class apiRepository extends GetxController {


  // @override
  // Future add(Place item) async {
  //   await Future.delayed(Duration(milliseconds: 10));
  //   //서버 통신
  //   items.add(Place(item.title, item.type, item.address, item.price, item.fish,
  //       item.nums, item.structure, item.lat,item.lon));
  // }
  //
  // @override
  // Future<List<Place>> getAll() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return items;
  // }

  int selected = 0;
  void select(int index) {
    selected = index;
    update();
  }

}