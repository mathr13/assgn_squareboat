import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

import 'failure_helper.dart';

class LocationHelper {

  final Location location;

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  LocationHelper(this.location);

  Future<Either<Failure, LocationData>> fetchDeviceLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Left(Failure.fromServerError("FLValueLabels.locationServiceDisabled"));
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Left(Failure.fromServerError("FLValueLabels.locationFetchError"));
      }
    }

    _locationData = await location.getLocation();
    return Right(_locationData);

  }

}