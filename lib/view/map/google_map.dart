import 'dart:async';
import 'package:fishingspot/repository/fishing_api.dart';
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:fishingspot/viewmodel/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage(this.item);

  final Items item;

  @override
  State<GoogleMapPage> createState() => GoogleMapPageState();
}

class GoogleMapPageState extends State<GoogleMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition? _kLake;
  List<Marker> _markers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _kLake = CameraPosition(
        target: LatLng(double.parse('${widget.item.latitude!}'), double.parse('${widget.item.longitude!}')),
        tilt: 20,
        zoom: 16);
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: LatLng(double.parse('${widget.item.latitude!}'), double.parse('${widget.item.longitude!}')),));
  }


  @override
  Widget build(BuildContext context) {
    final locate = Get.find<LocationViewModel>();

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        initialCameraPosition: locate.isLoading
            ? CameraPosition(
                target: LatLng(1, -1),
              )
            : CameraPosition(
                target: LatLng(double.parse('${widget.item.latitude!}'), double.parse('${widget.item.longitude!}')),
              ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: FloatingActionButton.extended(
            onPressed: _goToTheLake,
            label: Text('go!'),
          ),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake!));
  }
}
