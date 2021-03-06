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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Text(
                  '목록', //Todo 몇 km 인지 확인
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[300]),
          Carousel(apiViewModel),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 10),
            child: Text(
              '가까운 순서',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.grey[300]),
          ListCards(apiViewModel.fishing),
        ],
      ),
    );
  }
}
