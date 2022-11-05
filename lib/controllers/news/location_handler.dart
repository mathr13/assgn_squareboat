import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

import '../../constants/constant_values.dart';
import '../../constants/widgets/sbsnackbar.dart';
import '../../injector.dart';
import '../../models/location_model.dart';
import '../../services/failure_helper.dart';
import '../../services/location_helper.dart';
import 'news_controller.dart';

extension LocationHandler on NewsController {

  Future<LocationModel> getCurrentLocationCoodinatesForDevice() async {
    Either<Failure, LocationData> response = await getIt.get<LocationHelper>().fetchDeviceLocation();
    late LocationModel resultLocation;
    response.fold(
      (l) {
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, SBDisplayLabels.errorfetchinglocation);
        hideProgressBar();
      },
      (r) {
        resultLocation = LocationModel(latitude: r.latitude!, longitude: r.longitude!);
      },
    );
    return resultLocation;
  }

  Future<List<String>> getCountryForCoordinates({required double latitude, required double longitude}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    return [placemarks.first.isoCountryCode ?? "", placemarks.first.country ?? ""];
  }

  Future<String> getDeviceLocation() async {
    var locationModel = await getCurrentLocationCoodinatesForDevice();
    List<String> countryDetails = await getCountryForCoordinates(latitude: locationModel.latitude, longitude: locationModel.longitude);
    return countryDetails.first;
  }

}