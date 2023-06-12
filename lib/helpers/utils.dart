import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nitenite/models/asset.dart';

void showToast(String msg) {
  Fluttertoast.showToast(msg: msg);
}

String getAssetTypeString(Type assetType) {
  switch (assetType) {
    case Type.MUSIC: return "music";
    case Type.SOUND: return "sound";
    default: return "";
  }
}

Gradient buildGradient(Color color) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [
      0.0,
      0.5,
      0.7,
      0.9,
    ],
    colors: [
      color.withOpacity(0.25),
      color.withOpacity(0.33),
      color.withOpacity(0.66),
      color,
    ],
  );
}