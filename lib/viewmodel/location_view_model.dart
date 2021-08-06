import 'package:fishingspot/data/model/place_model.dart';
import 'package:fishingspot/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';


class LocationViewModel extends GetxController {

  final _locationRepository = LocationRepository();
  final distance = Distance();
  Position? position;
  bool isLoading = true;


  LocationViewModel() {
    fetch();
    update();
  }

  Future fetch() async {

    position = await _locationRepository.getCurrentLocation();
    isLoading = false;
    // print('------>>>>>> succesess   ${isLoading}');
    // print('${position!.longitude},${position!.latitude}');
    update();
  }

  void latlong() {
    final int km = distance.as(LengthUnit.Kilometer,
        LatLng(position!.latitude, position!.longitude), LatLng(, 7.46694444)) as int;
  }





}