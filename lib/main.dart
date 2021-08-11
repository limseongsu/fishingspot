import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/splashscreen/splash_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ApiViewModel>(ApiViewModel());
  runApp(
      GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp())
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



