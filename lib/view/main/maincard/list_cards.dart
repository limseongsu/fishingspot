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

  ScrollController _controller = ScrollController();

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
                    color: Colors.white,
                    child: Column(
                      children: [
                    Container(
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0Xff60B1FF),Color(0XFF60DCFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                          child: ListTile(
                            title: Text('${repository.fishing[index].fshlcNm}'),
                            subtitle: Text('${repository.fishing[index].useCharge}'),
                            trailing: FavoriteButton(
                                isFavorite: false,
                              iconColor: Colors.red,
                                valueChanged: (){

                            }),
                          ),
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
