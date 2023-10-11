import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickerUtils {
  const PickerUtils._();

  static final ImagePicker _picker = ImagePicker();

  static Future<Uint8List?> imgFromGallery() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image == null) return null;

    return await image.readAsBytes();
  }
}
