import 'package:fishingspot/repository/fake_getx.dart';
import 'package:fishingspot/view/bookmarks/bookmarks_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:fancy_bar/fancy_bar.dart';
import 'mainbody/main_body.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final placeRepository = Get.find<FakeGet>();


  List<Widget> pages = [
    MainBody(),
    BookMarksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEFAFF),
      appBar: NewGradientAppBar(
        title: Text(
          '어 항',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        gradient:
            // appbar gradient
            LinearGradient(colors: [Color(0XFF0052D4), Color(0Xff9CECFB)]),
      ),
      bottomNavigationBar: FancyBottomBar(
        selectedIndex: placeRepository.selected,
        onItemSelected: (int index) {
          setState(() {
            placeRepository.selected = index;
          });
        },
        items: [
          FancyItem(
              textColor: Colors.black54, title: '홈', icon: Icon(Icons.home)),
          FancyItem(
              textColor: Colors.black54, title: '북마크', icon: Icon(Icons.home)),
        ],
      ),
      body: pages[placeRepository.selected],
    );
  }
}
