import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lestari_laundry/src/app.dart';
import 'package:lestari_laundry/src/utilities/utilities.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: colorName.primary,
    ),
  );
  runApp(
    DevicePreview(
      builder: (context) => App(), // Wrap your app
    ),
  );
}
