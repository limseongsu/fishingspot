import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:fishingspot/view/detail/detail.dart';
import 'package:fishingspot/viewmodel/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:favorite_button/favorite_button.dart';


class ListCards extends StatefulWidget {
  @override
  State<ListCards> createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  final repository = Get.find<ApiViewModel>();
  final location = Get.find<LocationViewModel>();

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    repository.fishing;
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: repository.fishing.isEmpty ? CircularProgressIndicator()
      : ListView.builder(
        controller: _controller,
        shrinkWrap: true,
        itemCount: repository.fishing.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: repository.selected,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 150.0,
              child: FadeInAnimation(
                child: InkWell(
                  onTap: () {
                    Get.to(DetailPage(repository.fishing[index]));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('${repository.fishing[index].fshlcNm}'),
                          subtitle: Text('${repository.fishing[index].useCharge}'),
                          trailing: FavoriteButton(
                              isFavorite: false,
                            iconColor: Colors.red,
                              valueChanged: (){
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
