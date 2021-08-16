import 'package:fishingspot/view/main/main_home.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  final apiViewModel = Get.find<ApiViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFB1D5FF),
      body: Column(
        children: [
          SizedBox(height: 250,),
          Text('어   항',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.only(top:10,bottom: 10),
            child: Text('내 주변 가까운 순서로 낚시터 찾기'),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MainPage(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                '시작하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
