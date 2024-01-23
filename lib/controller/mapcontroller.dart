import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapScreenController extends GetxController {
  LatLng? currentLocation;

  @override
  void onInit() {
    getLatLng();
    print(currentLocation);
    super.onInit();
  }

  Future<void> getLatLng() async {
    final locationDaa = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation = LatLng(locationDaa.latitude, locationDaa.longitude);
  }
}
