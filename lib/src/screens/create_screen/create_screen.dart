import 'dart:io';
import 'package:admin_jewellery_app/src/screens/bloc/product_bloc/product_bloc.dart';
import 'package:admin_jewellery_app/src/screens/create_screen/components/widget_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/utils/utils.dart';
import '../create_screen/components/app_bar_text.dart';
import 'components/add_photo.dart';
import 'components/create_button.dart';
import 'components/text_field_widget.dart';

part './mixin/create_mixin.dart';

class CreateScreens extends StatefulWidget {
  const CreateScreens({super.key});

  @override
  State<CreateScreens> createState() => _CreateScreensState();
}

class _CreateScreensState extends State<CreateScreens> with CreateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back Button and AppBar
                const BackButtonWidget(),
                const SizedBox(height: 10),

                /// Add Photos
                AddPhotos(
                  presserOne: () {
                    setState(() {
                      _showPicker(context, 1);
                    });
                  },
                  presserTwo: () {
                    setState(() {
                      _showPicker(context, 2);
                    });
                  },
                  presserThree: () {
                    setState(() {
                      _showPicker(context, 3);
                    });
                  },
                  imageOne: _imageOne,
                  imageTwo: _imageTwo,
                  imageThree: _imageThree,
                  closeOne: () {
                    setState(() {
                      _imageOne = null;
                    });
                  },
                  closeTwo: () {
                    setState(() {
                      _imageTwo = null;
                    });
                  },
                  closeThree: () {
                    setState(() {
                      _imageThree = null;
                    });
                  },
                ),

                const SizedBox(height: 10),

                /// TextField Name
                WidgetTextField(
                  controller: nameController,
                  hintText: 'Name',
                ),
                const SizedBox(height: 10),

                /// TextField Price
                WidgetTextField(
                  controller: priceController,
                  hintText: 'Price',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),

                /// TextField Description
                WidgetTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 5,
                ),
                const SizedBox(height: 10),

                /// DropdownButton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// DropdownButton Jewellery
                    DropWidget(
                      value: dropdownValue,
                      values: options,
                      onChange: (value) {
                        dropdownValue = value;
                        setState(() {});
                      },
                    ),

                    /// DropdownButton Gender
                    DropWidget(
                      value: dropdownGender,
                      values: gender,
                      onChange: (value) {
                        dropdownGender = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Create Button
                CreateButton(
                  onPressed: () => _createProduct(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
