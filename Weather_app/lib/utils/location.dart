import 'package:location/location.dart';

class LocationHelper {
  late var latitude;
  late var longitude;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGrated;
    LocationData _locationData;

    //Location için servis ayakta mı?
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    //konum izin kontrolü
    _permissionGrated = await location.hasPermission();
    if (_permissionGrated == PermissionStatus.denied) {
      _permissionGrated = await location.requestPermission();
      if (_permissionGrated != PermissionStatus.granted) {
        return;
      }
    }

    //izinler tamam ise

    _locationData = await location.getLocation();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
  }
}
