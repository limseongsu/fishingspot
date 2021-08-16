import 'package:fishingspot/view/start/start_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Get.find<ApiViewModel>().api();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        backgroundImage: AssetImage('assets/fishing.jpg'),
        //중간 로고를 꼭 넣어야되서 투명처리해서 안보이게 함.
        logo: Image.asset('assets/fishing.jpg', color: Colors.transparent,),
        navigator: StartPage(),
        durationInSeconds: 4,
        showLoader: true,
        loadingText: Text('로딩중',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        loaderColor: Colors.white,
        loadingTextPadding: EdgeInsets.only(bottom: 250),
      ),
    );
  }
}
