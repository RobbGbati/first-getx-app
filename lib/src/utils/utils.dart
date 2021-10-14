import 'package:flutter/material.dart';

class Utils {
  
  TextStyle createTextStyle(double size, {FontWeight weight = FontWeight.normal, Color color = Colors.transparent}) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color);
  }
}