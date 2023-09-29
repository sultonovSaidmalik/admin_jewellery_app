import 'dart:io';

import 'package:admin_jewellery_app/src/common/styles/text_style.dart';
import 'package:admin_jewellery_app/src/screens/bloc/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/utils/utils.dart';
import '../create_screen/components/app_bar_text.dart';

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
                Row(
                  children: [
                    /// Bask Button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                    ),

                    /// Screen Name
                    const AppBarTextWidgets(),
                  ],
                ),
                const SizedBox(height: 10),

                /// Add Photos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showPicker(context, 1);
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 2.3,
                        height: MediaQuery.sizeOf(context).width * 1.03,
                        color: Colors.grey,
                        child: _imageOne == null
                            ? const Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : Stack(
                                children: [
                                  Image.file(
                                    _imageOne!,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.black12,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _imageOne = null;
                                            });
                                          },
                                          icon: const Icon(
                                              Icons.highlight_remove),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showPicker(context, 2);
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            height: MediaQuery.sizeOf(context).width * 0.5,
                            color: Colors.grey,
                            child: _imageTwo == null
                                ? const Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      Image.file(
                                        _imageTwo!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color: Colors.black12,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _imageTwo = null;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.highlight_remove),
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            _showPicker(context, 3);
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            height: MediaQuery.sizeOf(context).width * 0.5,
                            color: Colors.grey,
                            child: _imageThree == null
                                ? const Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      Image.file(
                                        _imageThree!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color: Colors.black12,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _imageThree = null;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.highlight_remove),
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// TextField Name
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: "Name",
                    hintStyle: Styles.textField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),

                /// TextField Price
                 TextField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: "Price",
                    hintStyle: Styles.textField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),

                /// TextField Description
                 TextField(
                  maxLines: 5,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: "Description",
                    hintStyle: Styles.textField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),

                /// DropdownButton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// DropdownButton Jewellery
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Center(
                        child: DropdownButton<String>(
                          underline: const SizedBox(),
                          value: dropdownValue,
                          dropdownColor: Colors.grey.shade900,
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          style: const TextStyle(color: Colors.white),
                          selectedItemBuilder: (BuildContext context) {
                            return options.map((String value) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  dropdownValue,
                                  style: Styles.textField,
                                ),
                              );
                            }).toList();
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    /// DropdownButton Gender
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Center(
                        child: DropdownButton<String>(
                          underline: const SizedBox(),
                          value: dropdownGender,
                          dropdownColor: Colors.grey.shade900,
                          onChanged: (String? value) {
                            setState(() {
                              dropdownGender = value!;
                            });
                          },
                          style: const TextStyle(color: Colors.white),
                          selectedItemBuilder: (BuildContext context) {
                            return options.map((String value) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  dropdownGender,
                                  style: Styles.textField,
                                ),
                              );
                            }).toList();
                          },
                          items: gender
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: _createProduct,
                  child: const Text("Create"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
