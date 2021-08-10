//
// import 'package:fishingspot/repository/location_repository.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
//
//
//
// class LocationViewModel extends GetxController {
//
//   final _locationRepository = LocationRepository();
//
//   Position? position;
//
//   bool isLoading = true;
//
//   Future<Position?> fetch() async {
//     position = await _locationRepository.getCurrentLocation();
//     isLoading = false;
//     // print('------>>>>>> succesess   ${isLoading}');
//     // print('${position!.longitude},${position!.latitude}');
//     update();
//     return position;
//   }
//
//
//
//
//
//
//
// }