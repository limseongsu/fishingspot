import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:fishingspot/view/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                gradient: LinearGradient(colors: [Colors.white10,Colors.black12],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: ListTile(
                title: Text('${fishing.fshlcNm ?? '정보없음'}'),
                subtitle:
                Text('가격: ${fishing.useCharge ?? '정보없음'}\n거리: ${fishing.meter! / 1000}km'),
                trailing: IconButton(
                  onPressed: () {
                    bookmarkPressed?.call(fishing.fshlcNm!);
                  },
                  icon: Icon( isBookmarked ? Icons.favorite : Icons.favorite_border,
                      color: isBookmarked ? Colors.red : Colors.white,size: 40,),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}