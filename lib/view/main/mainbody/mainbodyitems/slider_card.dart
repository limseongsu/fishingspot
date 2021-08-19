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
              colors: [Colors.white10, Colors.black12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: 450,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text('${item.fshlcNm}',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(item.rdnmadr != 'null' ?
                    '주소 : ${item.rdnmadr}' : '주소 : 정보 없음',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(item.fshlcType != 'null' ?
                    '유형 : ${item.fshlcType}' : '유형 : 정보 없음',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(item.useCharge != 'null' ?
                    '가격 : ${item.useCharge}' :'가격 : 정보 없음',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(item.phoneNumber != 'null' ?
                    '전화번호 : ${item.phoneNumber}' : '전화번호 : 정보 없음',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  '※ 정보가 변동되었을 수 있습니다.',
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
