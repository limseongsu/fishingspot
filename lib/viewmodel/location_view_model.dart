
import 'package:fishingspot/viewmodel/api_view_model.dart';
import 'package:fishingspot/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';



class LocationViewModel extends GetxController {

  final _locationRepository = LocationRepository();
  // final _apiRepository = ApiViewModel();

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







}