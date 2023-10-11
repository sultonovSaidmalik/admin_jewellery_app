part of '../create_screen.dart';

mixin CreateMixin on State<CreateScreens> {
  Uint8List? _imageOne;
  Uint8List? _imageTwo;
  Uint8List? _imageThree;

  List<String> options = ["Ring", "Necklace", "Bracelet"];
  String dropdownValue = 'Ring';
  List<String> gender = ["Man", "Women"];
  String dropdownGender = 'Man';

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _createProduct(BuildContext context) {
    if(nameController.text.isEmpty ) return AppUtils.msg(context, "Maxsultni nomi kiritilmadi");
    if(descriptionController.text.isEmpty) return AppUtils.msg(context, "Maxsultni tavsifi kiritilmadi");
    if(priceController.text.isEmpty) return AppUtils.msg(context, "Maxsultni summasi kiritilmadi");
    if(_imageOne == null) return AppUtils.msg(context, "Maxsultni Birinchi rasimi kiritilmadi");
    if(_imageTwo == null) return AppUtils.msg(context, "Maxsultni Ikkinchi rasimi kiritilmadi");
    if(_imageThree == null) return AppUtils.msg(context, "Maxsultni Uchinchi rasimi kiritilmadi");
    context.read<ProductBloc>().add(ProductCreateEvent(
          name: nameController.text.trim(),
          description: descriptionController.text.trim(),
          files: [_imageOne!, _imageTwo!, _imageThree!],
          price: num.tryParse(priceController.text.trim()) ?? 0,
          type: dropdownValue,
          genderType: dropdownGender,
        ));
    print("Data");
    Navigator.pop(context);
  }

  void _showPicker(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Pick Photo"),
                onTap: () async {
                  Uint8List? file = await AppUtils.imgFromGallery();
                  if (file == null) {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  } else {
                    if (index == 1) {
                      _imageOne = file;
                    } else if (index == 2) {
                      _imageTwo = file;
                    } else if (index == 3) {
                      _imageThree = file;
                    }
                  }
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Take Photo"),
                onTap: () async {
                  Uint8List? file = await AppUtils.imgFromCamera();
                  if (file == null) {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  } else {
                    if (index == 1) {
                      _imageOne = file;
                    } else if (index == 2) {
                      _imageTwo = file;
                    } else if (index == 3) {
                      _imageThree = file;
                    }
                  }
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
