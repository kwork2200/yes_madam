import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddAddressController extends GetxController {
  GoogleMapController? mapController;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController houseFlatController = TextEditingController();

  final RxDouble lat = 21.1702.obs; // Default: Surat
  final RxDouble lng = 72.8311.obs;
  final RxString resolvedAddress = ''.obs;
  final RxBool isFetchingLocation = false.obs;
  final RxBool isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    _reverseGeocode(lat.value, lng.value);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraMove(CameraPosition position) {
    lat.value = position.target.latitude;
    lng.value = position.target.longitude;
  }

  void onCameraIdle() {
    _reverseGeocode(lat.value, lng.value);
  }

  Future<void> goToCurrentLocation() async {
    isFetchingLocation.value = true;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar('Location Disabled', 'Please enable location services.',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Permission Denied', 'Location permission is required.',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      lat.value = position.latitude;
      lng.value = position.longitude;

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(position.latitude, position.longitude),
          16,
        ),
      );

      await _reverseGeocode(position.latitude, position.longitude);
    } catch (e) {
      Get.snackbar('Error', 'Could not fetch location. Try again.',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isFetchingLocation.value = false;
    }
  }

  Future<void> _reverseGeocode(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        resolvedAddress.value = [
          p.street,
          p.subLocality,
          p.locality,
          p.administrativeArea,
          p.postalCode,
        ].where((e) => e != null && e.isNotEmpty).join(', ');
      }
    } catch (_) {
      resolvedAddress.value = 'Unable to fetch address';
    }
  }

  Future<void> saveAddress() async {
    if (houseFlatController.text.trim().isEmpty) {
      Get.snackbar('Required', 'Please enter House / Flat / Building',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isSaving.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isSaving.value = false;
    Get.back();
    Get.snackbar('Success', 'Address saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFaf7379),
        colorText: Colors.white);
  }

  @override
  void onClose() {
    searchController.dispose();
    houseFlatController.dispose();
    mapController?.dispose();
    super.onClose();
  }
}