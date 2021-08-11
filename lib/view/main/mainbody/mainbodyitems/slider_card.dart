import 'package:fishingspot/data/model/fishing_api.dart';
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
              colors: [Color(0Xff60B1FF),Color(0XFF60DCFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: 450,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text('${item.fshlcNm}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('주소 : ${item.rdnmadr}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('유형 : ${item.fshlcType}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('가격 : ${item.useCharge}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('전화번호 : ${item.phoneNumber}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 30),
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
