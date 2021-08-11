import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:fishingspot/view/detail/detail.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ListCards extends StatelessWidget {
  final List<Items> fishing;

  ListCards(this.fishing);

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<ApiViewModel>();

    return AnimationLimiter(
      child: fishing.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
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

class FishingTile extends StatelessWidget {
  final Items fishing;
  final bool isBookmarked;
  final Function(String)? bookmarkPressed;

  FishingTile(this.fishing, this.isBookmarked, {this.bookmarkPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailPage(fishing));
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0Xff60B1FF), Color(0XFF60DCFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: ListTile(
                title: Text('${fishing.fshlcNm}'),
                subtitle: Text('${fishing.useCharge}'),
                trailing: IconButton(
                  onPressed: () {
                    bookmarkPressed?.call(fishing.fshlcNm!);
                  },
                  icon: Icon(Icons.favorite_border,
                      color: isBookmarked ? Colors.red : Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
