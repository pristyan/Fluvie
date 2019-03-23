import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

toast(String message) {
  return Fluttertoast.showToast(
    msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0
  );
}