import 'package:carousel_slider/carousel_slider.dart';
import 'package:fishingspot/repository/fishing_api.dart';
import 'package:fishingspot/view/main/mainbody/mainbodyitems/slider_card.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';




CarouselSlider Carousel(ApiViewModel result) {

  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 2),
      autoPlayAnimationDuration: Duration(milliseconds: 350),
      enlargeCenterPage: true,
    ),
    items: result.fishing.
    map((item) => SliderCard(item))
        .toList(),
  );
}
