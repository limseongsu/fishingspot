
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:fishingspot/repository/fishing_api.dart';
import 'package:fishingspot/view/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Card SliderCard(Items item) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    child: InkWell(
      onTap: () {
        Get.to(DetailPage(item));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: [Color(0XFF0052D4), Color(0Xff9CECFB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: 400,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text('${item.fshlcNm}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text('주소 : ${item.rdnmadr}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text('유형 : ${item.fshlcType}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text('가격 : ${item.useCharge}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text('전화번호 : ${item.phoneNumber}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 13),
              Center(
                child: Text(
                  '※정보가 변동되었을 수 있습니다.',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
