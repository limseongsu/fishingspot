import 'package:fishingspot/data/model/fishing_api.dart';
import 'package:fishingspot/view/map/google_map.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.item);

  final Items item;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '${widget.item.fshlcNm}',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 300, child: GoogleMapPage(widget.item)),
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  '거리 : ${widget.item.meter! / 1000}km' ,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(widget.item.useCharge != 'null' ?
                  '가격 : ${widget.item.useCharge}' : '가격 : 정보 없음',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(widget.item.fshlcType != 'null' ?
                  '유형 : ${widget.item.fshlcType}' : '유형 : 정보 없음',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(widget.item.kdfsh != 'null' ?
                  '대상어종 : ${widget.item.kdfsh}' :'대상어종 : 정보 없음',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(widget.item.wtrcFcltyType != 'null' ?
                  '구조물 : ${widget.item.wtrcFcltyType}' : '구조물 : 정보 없음',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  widget.item.rdnmadr != 'null' ?
                  '주소 : ${widget.item.rdnmadr}'
                  :'주소 : 정보 없음',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),

                SizedBox(height: 10),
                Text(widget.item.phoneNumber != 'null' ?
                  '전화번호 : ${widget.item.phoneNumber}' : '전화번호 : 정보 없음',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
