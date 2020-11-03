import 'package:geolocator/geolocator.dart';

class Location {
  static double latitude;
  static double longitude;

  static Future<List<double>> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      return [latitude, longitude];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
