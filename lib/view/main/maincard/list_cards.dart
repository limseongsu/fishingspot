import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:fishingspot/view/main/maincard/fishing_tile.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ListCards extends StatelessWidget {
  final  ScrollController _controller = ScrollController();
  final List<Items> fishing;

  ListCards(this.fishing);

  Widget build(BuildContext context) {
    final viewModel = Get.find<ApiViewModel>();
    return AnimationLimiter(
      child: fishing.isEmpty
          ? Center(child: Text(''))
          : ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemCount: fishing.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => FishingTile(fishing[index],
                      viewModel.bookMarks.contains(fishing[index].fshlcNm),
                      bookmarkPressed: (name) {
                    viewModel.bookMark(name);
                  }),
                );
              },
            ),
    );
  }
}


