import 'package:flutter/material.dart';

class NumberAudio {
  String audioUri;
  MaterialColor buttonColor;
  String buttonText;

  NumberAudio(String aUri, MaterialColor bColor, String bText) {
    this.audioUri = aUri;
    this.buttonColor = bColor;
    this.buttonText = bText;
  }
}
