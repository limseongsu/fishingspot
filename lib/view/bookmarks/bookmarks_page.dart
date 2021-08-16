import 'package:fishingspot/view/main/maincard/list_cards.dart';
import 'package:flutter/material.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:get/get.dart';
class BookMarksPage extends StatefulWidget {
  @override
  _BookMarksPageState createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<ApiViewModel>();
    return Scaffold(
      backgroundColor: Color(0xffDCF9FF),
      body: ListCards(viewModel.favoriteFishing),
    );
  }
}
