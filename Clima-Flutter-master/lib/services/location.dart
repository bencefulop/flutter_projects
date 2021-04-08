import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitude});
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      print('getting position');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
