import 'package:flutter/material.dart';

/// This is a global SizeBox that has a default value of height 10
/// and width of double.infinity
SizedBox sizedBox({double? height, double? width}) {
  return SizedBox(
    height: height ?? 10,
    width: width ?? double.infinity,
  );
}
