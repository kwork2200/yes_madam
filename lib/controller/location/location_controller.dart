import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_texts.dart';

class LocationController extends GetxController {
  final RxString locationTitle = AppTexts.fetchingLocation.obs;
  final RxString locationAddress = AppTexts.fetchingLocationDesc.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationTitle.value = AppTexts.locationDisabled;
      locationAddress.value = AppTexts.enableLocationServices;
      await Future.delayed(const Duration(seconds: 2));
      Get.offNamed(AppRoutes.bottomNavBar);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationTitle.value = AppTexts.permissionDenied;
        locationAddress.value = AppTexts.grantLocationPermission;
        await Future.delayed(const Duration(seconds: 2));
        Get.offNamed(AppRoutes.bottomNavBar);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationTitle.value = AppTexts.permissionDenied;
      locationAddress.value = AppTexts.locationPermissionsPermanentlyDenied;
      await Future.delayed(const Duration(seconds: 2));
      Get.offNamed(AppRoutes.bottomNavBar);
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        locationTitle.value = place.subLocality ?? place.locality ?? AppTexts.currentLocation;

        locationAddress.value = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}, ${place.country}';

        await Future.delayed(const Duration(seconds: 2));
        Get.offNamed(AppRoutes.bottomNavBar);
      }
    } catch (e) {
      locationTitle.value = AppTexts.errorTitle;
      locationAddress.value = AppTexts.failedToFetchLocation;
      await Future.delayed(const Duration(seconds: 2));
      Get.offNamed(AppRoutes.bottomNavBar);
    }
  }

  void confirmLocation() {
    Get.offNamed(AppRoutes.bottomNavBar);
  }
}