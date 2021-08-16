import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fishingspot/view/bookmarks/bookmarks_page.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'mainbody/main_body.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final apiViewModel = Get.find<ApiViewModel>();

  List<Widget> pages = [
    MainBody(),
    BookMarksPage(),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCF9FF),
      appBar: NewGradientAppBar(
        title: Text(
          '어      항',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        gradient:
            // appbar gradient
            LinearGradient(colors: [Color(0Xff60B1FF), Color(0XFF60DCFF)]),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0Xff60B1FF),
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.linear,
        backgroundColor: Color(0XFFE1FDFF),
        buttonBackgroundColor: Color(0XFFC9FDFF),
        height: 55,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
          ),
          Icon(
            Icons.bookmark,
            size: 25,
          ),
        ],
        onTap: (int index) {
          setState(() {
            apiViewModel.selected = index;
          });
        },
      ),
      body: pages[apiViewModel.selected],
    );
  }
}
// FancyBottomBar(
// type: FancyType.FancyV1,
// selectedIndex: apiViewModel.selected,
// onItemSelected: (int index) {
// setState(() {
// apiViewModel.selected = index;
// });
// },
// items: [
// FancyItem(
// textColor:  Colors.black, title: '홈', icon: Icon(Icons.home)),
// FancyItem(
// textColor: Colors.black, title: '북마크', icon: Icon(Icons.bookmark)),
// ],
// ),
