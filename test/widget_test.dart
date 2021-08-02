// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:fishingspot/repository/fishing_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


void main() {
  test('http 통신 테스트', () async {
    var uri = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_public_fshlc_api?serviceKey=yZryteylroOPylwMo3nICWa%2BSGNEuPoH58aijP%2BvG91RjxkJzd0WNLQcfF6O%2FrngdeBEfu75WjauflOu7d4CWQ%3D%3D&pageNo=0&numOfRows=100&type=json');
    var response = await http.get(uri);
    expect(response.statusCode, 200);
    Fishing fishing = Fishing.fromJson(json.decode(response.body));
    expect(fishing.response!.body!.items![0].fshlcNm, '2박3일낚시터');
  });
}
