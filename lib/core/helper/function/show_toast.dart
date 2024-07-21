import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//? flutter toast

void showToast({required String mes, Color? color}) {
  Fluttertoast.showToast(
    msg: mes,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: color ?? Colors.green[400],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
