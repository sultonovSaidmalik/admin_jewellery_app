import 'platform/stub.dart'
    if (dart.library.io) 'platform/io.dart'
    if (dart.library.js) 'platform/web.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppUtils {
  static final ImagePicker _picker = ImagePicker();

  AppUtils._();

  static void msg(BuildContext context, String message,
      {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  static Future<Uint8List?> imgFromGallery() => PickerUtils.imgFromGallery();

  static Future<Uint8List?> imgFromCamera() => PickerUtils.imgFromCamera();
}
