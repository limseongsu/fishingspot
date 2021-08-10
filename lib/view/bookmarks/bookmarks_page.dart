import 'package:fishingspot/view/main/maincard/list_cards.dart';
import 'package:flutter/material.dart';

class BookMarksPage extends StatefulWidget {
  @override
  _BookMarksPageState createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListCards(),
    );
  }
}
