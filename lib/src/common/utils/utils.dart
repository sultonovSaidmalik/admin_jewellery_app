

import 'dart:io';

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

  static Future<File?> imgFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if(image == null) return null;
    return File(image!.path);
  }

  static Future<File?> imgFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if(image == null) return null;
    return File(image!.path);
  }
}