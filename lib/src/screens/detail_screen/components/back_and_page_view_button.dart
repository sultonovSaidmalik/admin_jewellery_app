
import 'package:admin_jewellery_app/src/common/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animatedCircleContainer.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    );
  }
}


class WidgetPageView extends StatefulWidget {
  final Product product;
  const WidgetPageView({super.key, required this.product});

  @override
  State<WidgetPageView> createState() => _WidgetPageViewState();
}

class _WidgetPageViewState extends State<WidgetPageView> {
  final PageController screenController = PageController(initialPage: 0);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width,
          child: PageView(
            controller: screenController,
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            children: widget.product.images
                .map(
                  (image) => ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),

          /// Row with White and grey Circle AnimatedContainer in PageView
          child: AnimatedCircleContainerInPageView(index: index),
        ),
      ],
    );
  }
}
