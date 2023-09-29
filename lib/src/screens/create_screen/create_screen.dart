import 'package:admin_jewellery_app/src/common/styles/text_style.dart';
import 'package:flutter/material.dart';
import '../create_screen/components/app_bar_text.dart';

class CreateScreens extends StatefulWidget {
  const CreateScreens({super.key});

  @override
  State<CreateScreens> createState() => _CreateScreensState();
}

class _CreateScreensState extends State<CreateScreens> {
  List<String> options = [
   "Ring", "Necklace" , "Bracelet"
  ];
  String dropdownValue = 'Ring';
  List<String> gender = [
    "Man", "Women"];
  String dropdownGender = 'Man';

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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).width * 0.75,
                      color: Colors.grey,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
                const SizedBox(height: 10),

                /// TextField Name
                const TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Name",
                    hintStyle: Styles.textField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),

                /// TextField Price
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Price",
                    hintStyle: Styles.textField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),

                /// TextField Description
                const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Description",
                    hintStyle: Styles.textField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: TextStyle(
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
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey, width: 1)
                      ),
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
                          items: options.map<DropdownMenuItem<String>>((String value) {
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
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey, width: 1)
                      ),
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
                          items: gender.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
