import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

class PickerUtils {
  const PickerUtils._();

  static Future<Uint8List?> imgFromGallery() async {

    final ImagePickerPlugin plugin = ImagePickerPlugin();

    // Init the pick file dialog...
    final Future<XFile?> image = plugin.getImageFromSource(
      source: ImageSource.gallery,
    );

    Uint8List? byte = await (await image)?.readAsBytes();

    if (byte == null) return null;

    return byte;
  }
}
