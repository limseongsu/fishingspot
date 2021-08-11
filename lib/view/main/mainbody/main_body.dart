import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:fishingspot/view/main/maincard/list_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mainbodyitems/carousel_slider.dart';

class MainBody extends StatefulWidget {



  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final apiViewModel = Get.find<ApiViewModel>();



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO 드랍다운 메뉴 만들기
            Padding(
              padding: const EdgeInsets.only(top:5,left: 5),
              child: Text(
                '목록', //Todo 몇 km 인지 확인
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Divider(),
            Carousel(apiViewModel),
            Divider(),
            Text('전체 목록',
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
            ),
            ListCards(),
          ],
        ),
      ),
    );
  }
}
