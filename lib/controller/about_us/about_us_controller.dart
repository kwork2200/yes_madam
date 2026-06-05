import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_texts.dart';

class AboutUsController extends GetxController {
  final selectedTeamIndex = 0.obs;

  List<String> get cities => AppTexts.cities;

  final List<Map<String, dynamic>> milestoneData = [
    {
      'value': AppTexts.professionalsCount,
      'label': AppTexts.professionalsLabel,
      'icon': Icons.person_pin_outlined,
    },
    {
      'value': AppTexts.appDownloadsCount,
      'label': AppTexts.appDownloadsLabel,
      'icon': Icons.file_download_outlined,
    },
    {
      'value': AppTexts.bookingsCompletedCount,
      'label': AppTexts.bookingsCompletedLabel,
      'icon': Icons.face_retouching_natural_outlined,
    },
    {
      'value': AppTexts.citiesCount,
      'label': AppTexts.citiesInIndiaLabel,
      'icon': Icons.location_on_outlined,
    },
    {
      'value': AppTexts.ratingCount,
      'label': AppTexts.topRatedBeautyAppLabel,
      'icon': Icons.star_border_rounded,
    },
  ];

  final List<Map<String, String>> whyYesMadamCards = [
    {
      'title': AppTexts.convenience,
      'description': AppTexts.convenienceDesc,
    },
    {
      'title': AppTexts.transparency,
      'description': AppTexts.transparencyDesc,
    },
    {
      'title': AppTexts.hygiene,
      'description': AppTexts.hygieneDesc,
    },
    {
      'title': AppTexts.freedomToUseOwnProducts,
      'description': AppTexts.freedomToUseOwnProductsDesc,
    },
  ];

  final List<Map<String, String>> coreBeliefsCards = [
    {
      'title': AppTexts.mission,
      'description': AppTexts.missionDesc,
    },
    {
      'title': AppTexts.vision,
      'description': AppTexts.visionDesc,
    },
    {
      'title': AppTexts.philosophy,
      'description': AppTexts.philosophyDesc,
    },
    {
      'title': AppTexts.values,
      'description': AppTexts.valuesDesc,
    },
  ];

  final List<Map<String, String>> servicesData = [
    {
      'title': AppTexts.femaleSalonAtHome,
      'imgUrl': AppTexts.femaleSalonImgUrl,
      'description': AppTexts.femaleSalonDesc,
    },
    {
      'title': AppTexts.femaleSpaAtHome,
      'imgUrl': AppTexts.femaleSpaImgUrl,
      'description': AppTexts.femaleSpaDesc,
    },
    {
      'title': AppTexts.femaleHydraGloLaser,
      'imgUrl': AppTexts.femaleHydraGloImgUrl,
      'description': AppTexts.femaleHydraGloDesc,
    },
    {
      'title': AppTexts.maleGrooming,
      'imgUrl': AppTexts.maleGroomingImgUrl,
      'description': AppTexts.maleGroomingDesc,
    },
    {
      'title': AppTexts.maleSpa,
      'imgUrl': AppTexts.maleSpaImgUrl,
      'description': AppTexts.maleSpaDesc,
    },
  ];

  void changeTeamMember(int index) {
    selectedTeamIndex.value = index;
  }
}