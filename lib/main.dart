import 'package:fishingspot/repository/fake_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/splashscreen/splash_page.dart';



void main() {
  // Get.put<LocationViewModel>(LocationViewModel());
  Get.put<FakeGet>(FakeGet());
  runApp(
      GetMaterialApp(home: MyApp())
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final placeRepository = Get.find<FakeGet>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '어 항',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}



