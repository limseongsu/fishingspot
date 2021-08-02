import 'dart:async';
import 'package:fishingspot/data/model/place_model.dart';
import 'package:fishingspot/repository/fake_getx.dart';
import 'package:fishingspot/viewmodel/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {

  GoogleMapPage(this.item);

  final Place item;

  @override
  State<GoogleMapPage> createState() => GoogleMapPageState();

}

class GoogleMapPageState extends State<GoogleMapPage> {


  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    final Place place = widget.item;
    final locate = Get.put<LocationViewModel>(LocationViewModel());
    // double distance = Geolocator.distanceBetween(
    //     locate.position!.latitude,locate.position!.longitude,double.parse('${place.lat}'),double.parse('${place.lon}'));

    return  Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: locate.isLoading ? CameraPosition(target: LatLng(37.43296265331129, -122.08832357078792),
        ) : CameraPosition(
          target: LatLng(locate.position!.latitude,locate.position!.longitude),
        ),

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: true,
        myLocationEnabled: true,

      ),
        );

  }
  final CameraPosition _myplace = CameraPosition(
    target: LatLng(32, -122.085749655962),
    zoom: 14.4746,
  );
  final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


// Future<void> _goToMyPlace() async {
//     final GoogleMapController controller = await .future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }


}
