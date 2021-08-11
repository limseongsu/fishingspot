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
      backgroundColor: Color(0XFFC9CFFF),
      appBar: NewGradientAppBar(
        title: Text(
          '${widget.item.fshlcNm}',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        gradient:
            LinearGradient(colors: [Color(0Xff60B1FF), Color(0XFF60DCFF)]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 300, child: GoogleMapPage(widget.item)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  '가격 : ${widget.item.useCharge}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  '유형 : ${widget.item.fshlcType}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  '대상어종 : ${widget.item.kdfsh}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  '구조물 : ${widget.item.wtrcFcltyType}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  '주소 : ${widget.item.rdnmadr}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  '전화번호 :${widget.item.phoneNumber}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
