import 'package:fishingspot/repository/fake_getx.dart';
import 'package:fishingspot/view/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ListCards extends StatelessWidget {
  final placeRepository = Get.find<FakeGet>();
  ScrollController _controller = ScrollController();

  void initState() {
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        controller: _controller,
        shrinkWrap: true,
        itemCount: placeRepository.items.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: placeRepository.selected,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 150.0,
              child: FadeInAnimation(
                child: InkWell(
                  onTap: () {
                    Get.to(DetailPage(placeRepository.items[index]));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('${placeRepository.items[index].title}'),
                      subtitle: Text('${placeRepository.items[index].price}'),
                      trailing: Icon(Icons.bookmark),
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
