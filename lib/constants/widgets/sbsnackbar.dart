import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SBSnackbars {

  static void errorSnackbar(String title, String message) {
    Get.snackbar(
      title, 
      message, 
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM
    );
  }

  static void successSnackbar(String title, String message) {
    Get.snackbar(
      title, 
      message, 
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM
    );
  }

}