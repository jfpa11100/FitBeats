import 'package:geolocator/geolocator.dart';

class LocationController {
  Future<Position> getLocation() async {
      final permission = await Geolocator.checkPermission(); 
      if (permission == LocationPermission.denied) {
        final request = await Geolocator.requestPermission();
        if (request == LocationPermission.denied) {
          return getLocation();
        }
      }
      return await Geolocator.getCurrentPosition();
  }
}