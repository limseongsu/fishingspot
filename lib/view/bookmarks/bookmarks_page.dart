import 'package:fishingspot/repository/fake_getx.dart';
import 'package:fishingspot/view/main/maincard/list_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarksPage extends StatefulWidget {
  @override
  _BookMarksPageState createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  final placeRepository = Get.find<FakeGet>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEFAFF),
      body: ListCards(),
    );
  }
}
