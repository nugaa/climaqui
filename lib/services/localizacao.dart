import 'package:geolocator/geolocator.dart';

class Localizacao {
  Position _position;
  double lat, lng;

  Future<void> getLocalizacao() async {
    LocationPermission _permission = await checkPermission();
    LocationPermission request = await requestPermission();

    if (_permission == LocationPermission.whileInUse ||
        _permission == LocationPermission.always) {
      _position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      lat = _position.latitude;
      lng = _position.longitude;
    } else if (request == LocationPermission.whileInUse ||
        request == LocationPermission.always) {
      _position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      lat = _position.latitude;
      lng = _position.longitude;
    } else {
      await requestPermission();
    }
  }
}
