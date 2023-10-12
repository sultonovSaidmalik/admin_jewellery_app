
import 'package:flutter/material.dart';

import '../../../common/models/product_model.dart';

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

class AnimatedCircleContainerInPageView extends StatelessWidget {
  const AnimatedCircleContainerInPageView({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.all(5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == i ? Colors.white : Colors.grey),
            ),
          ),
      ],
    );
  }
}