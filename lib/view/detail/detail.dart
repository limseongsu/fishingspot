import 'package:fishingspot/data/model/place_model.dart';
import 'package:fishingspot/repository/fake_getx.dart';
import 'package:fishingspot/view/map/google_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailPage extends StatefulWidget {
  DetailPage(this.item);

  final Place item;
  final placeRepository = Get.find<FakeGet>();



  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
  final Place placeRepository = widget.item;
    return Scaffold(
      appBar: AppBar(
        title: Text('${placeRepository.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
                child: GoogleMapPage(widget.item)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text('가격 : ${placeRepository.price}',style: TextStyle(fontSize: 20,color: Colors.blue),),
                SizedBox(height: 10),
                Text('유형 : ${placeRepository.type}',style: TextStyle(fontSize: 20,color: Colors.blue),),
                SizedBox(height: 10),
                Text('대상어종 : ${placeRepository.fish}',style: TextStyle(fontSize: 20,color: Colors.blue),),
                SizedBox(height: 10),
                Text('구조물 : ${placeRepository.structure}',style: TextStyle(fontSize: 20,color: Colors.blue),),
                SizedBox(height: 10),
                Text('주소 : ${placeRepository.address}',style: TextStyle(fontSize: 20,color: Colors.blue),),
                SizedBox(height: 10),
                Text('전화번호 :${placeRepository.num}',style: TextStyle(fontSize: 20,color: Colors.blue),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
