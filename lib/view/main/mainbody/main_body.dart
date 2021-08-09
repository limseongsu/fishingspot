import 'package:fishingspot/data/model/place_model.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:fishingspot/view/main/maincard/list_cards.dart';
import 'package:fishingspot/viewmodel/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mainbodyitems/carousel_slider.dart';

class MainBody extends StatelessWidget {
  final apiViewModel = Get.find<ApiViewModel>();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO 드랍다운 메뉴 만들기
          Padding(
            padding: const EdgeInsets.only(top:5.0,left: 5),
            child: Text(
              ' 목록', //Todo 몇 km 인지 확인
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
    );
  }
}
