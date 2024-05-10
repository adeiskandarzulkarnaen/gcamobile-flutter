import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setDeviceOrientation(Orientation deviceOrientation) {
  if (deviceOrientation == Orientation.landscape) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } else {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
