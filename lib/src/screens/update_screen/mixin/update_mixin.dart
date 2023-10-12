part of '../update_screen.dart';


mixin UpdateMixin on State<UpdateScreen> {


  List<String> options = ["Ring", "Necklace", "Bracelet"];
  late String dropdownValue = widget.product.productType ?? "";
  List<String> gender = ["Man", "Women"];
  late String dropdownGender = widget.product.genderType;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
}
