import 'package:carousel_slider/carousel_slider.dart';
import 'package:fishingspot/repository/fake_getx.dart';
import 'package:fishingspot/view/main/mainbody/mainbodyitems/slider_card.dart';

import 'package:get/get.dart';



CarouselSlider Carousel() {
  final placeRepository = Get.find<FakeGet>();


  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 2),
      autoPlayAnimationDuration: Duration(milliseconds: 350),
      enlargeCenterPage: true,
    ),
    items: placeRepository.items
        .map((item) => SliderCard(item))
        .toList(),
  );
}
