
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'Constant.dart';

class Utilities {
  static GetBar SuccessSnackBar({required String message}) {
    Get.log(" $message");
    return GetBar(
      titleText: Text('Success',  style: TextStyle(color: whiteColor),),
      messageText: Text(message, style: TextStyle(color: whiteColor),),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle_outline, size: 32, color: whiteColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 3),
    );
  }

  static GetBar WarningSnackBar({required String message}) {
    return GetBar(
      titleText: Text('Warning', style: TextStyle(color: whiteColor),),
      messageText: Text(message, style: TextStyle(color: whiteColor),),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.brown,
      icon: Icon(Icons.remove_circle_outline, size: 32, color: whiteColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 3),
    );
  }

  static GetBar ErrorSnackBar({required String message}) {
    Get.log("$message", isError: true);
    return GetBar(
      titleText: Text('Error', style: TextStyle(color: whiteColor),),
      messageText: Text(message, style: TextStyle(color: whiteColor),),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline, size: 32, color: whiteColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 3),
    );
  }
}
