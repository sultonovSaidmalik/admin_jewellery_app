
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
  const WidgetPageView({super.key});

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
            children: const [
              Image(
                image: AssetImage("assets/images/img.png"),
                fit: BoxFit.cover,
              ),
              Image(
                image: AssetImage("assets/images/img_2.png"),
                fit: BoxFit.cover,
              ),
              Image(
                image: AssetImage("assets/images/img.png"),
                fit: BoxFit.cover,
              ),
            ],
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
