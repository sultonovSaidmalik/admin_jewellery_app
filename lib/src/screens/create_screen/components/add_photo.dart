import 'dart:io';

import 'package:flutter/material.dart';

class AddPhotos extends StatefulWidget {
  final void Function() presserOne;
  final void Function() presserTwo;
  final void Function() presserThree;
  final void Function() closeOne;
  final void Function() closeTwo;
  final void Function() closeThree;
  final File? imageOne;
  final File? imageTwo;
  final File? imageThree;

  const AddPhotos({
    super.key,
    required this.presserOne,
    required this.presserTwo,
    required this.presserThree,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.closeOne,
    required this.closeTwo,
    required this.closeThree,
  });

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: widget.presserTwo,
              child: Container(
                width: MediaQuery.sizeOf(context).width / 2.3,
                height: MediaQuery.sizeOf(context).width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                child: widget.imageTwo == null
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
                            widget.imageTwo!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.black12,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: widget.closeTwo,
                                  icon: const Icon(Icons.highlight_remove),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: widget.presserThree,
              child: Container(
                width: MediaQuery.sizeOf(context).width / 2.3,
                height: MediaQuery.sizeOf(context).width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                child: widget.imageThree == null
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
                            widget.imageThree!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.black12,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: widget.closeThree,
                                  icon: const Icon(Icons.highlight_remove),
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
        const SizedBox(height: 10),
        GestureDetector(
          onTap: widget.presserOne,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 0.4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            child: widget.imageOne == null
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
                  widget.imageOne!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black12,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: widget.closeOne,
                        icon: const Icon(Icons.highlight_remove),
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
    );
  }
}
