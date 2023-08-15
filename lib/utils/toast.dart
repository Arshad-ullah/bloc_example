
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterTost
{
  static showToast(String text)
  {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}