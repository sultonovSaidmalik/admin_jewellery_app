import 'package:admin_jewellery_app/src/common/models/product_model.dart';
import 'package:admin_jewellery_app/src/screens/bloc/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/text_field_widget.dart';
import 'components/update_add_photo.dart';
import 'components/update_app_bar_text.dart';
import 'components/update_button.dart';
import 'components/widget_dropdown_button.dart';

part './mixin/update_mixin.dart';

class UpdateScreen extends StatefulWidget {
  final Product product;

  const UpdateScreen({super.key, required this.product});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> with UpdateMixin {
  @override
  void initState() {
    nameController.text = widget.product.productName ?? "";
    priceController.text = widget.product.productPrice.toString();
    descriptionController.text = widget.product.productDescription ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  /// Add Photos
                  WidgetPageView(
                    product: widget.product,
                  ),
                  const SizedBox(height: 10),

                  /// Back Button and AppBar
                  const UpdateBackButtonWidget(),
                  const SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 10),

              /// TextField Name
              UpdateWidgetTextField(
                controller: nameController,
                hintText: 'Name',
              ),
              const SizedBox(height: 10),

              /// TextField Price
              UpdateWidgetTextField(
                controller: priceController,
                hintText: 'Price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 10),

              /// TextField Description
              UpdateWidgetTextField(
                controller: descriptionController,
                hintText: 'Description',
                maxLines: 5,
              ),
              const SizedBox(height: 10),

              /// DropdownButton
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// DropdownButton Jewellery
                  UpdateDropWidget(
                    value: dropdownValue,
                    values: options,
                    onChange: (value) {
                      dropdownValue = value;
                      setState(() {});
                    },
                  ),

                  /// DropdownButton Gender
                  UpdateDropWidget(
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

              /// Update Button
              UpdateButton(
                onPressed: () {
                  context.read<ProductBloc>().add(
                        ProductUpdateEvent(
                          product: widget.product.copyWith(
                            productName: nameController.text,
                            productPrice: num.tryParse(priceController.text),
                            productDescription: descriptionController.text,
                            productType: dropdownValue,
                            genderType: dropdownGender,
                          ),
                        ),
                      );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
