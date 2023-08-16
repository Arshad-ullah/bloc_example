import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/components/colors.dart';
import '../../core/components/fontmanager.dart';

class CustomSnackBar {
  static showSnackBar(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: kgrayColor,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 3),
    );
  }

  static saveProfile() {
    Get.snackbar("Profile", "Save profile",
        titleText: manropeText(
          text: "Profile",
          fontSize: 16,
          color: kwhiteColor,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        messageText: manropeText(
          text: "Save profile",
          fontSize: 15,
          color: kwhiteColor,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: kdarkblueColor,
        backgroundGradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              kgrayColor,
              kdarkblueColor,
            ]));
  }

  static paypalSnackBar(String message) {
    Get.snackbar(
      "Paypal",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: kgrayColor,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 3),
    );
  }
}
