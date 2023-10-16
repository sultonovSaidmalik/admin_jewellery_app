import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';

class AppBarTextWidgets extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const AppBarTextWidgets({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      /// Screen Name
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
           Text(
            text,
            style: Styles.w700_25,
          ),
          const SizedBox.shrink()
        ],
      ),
    );
  }
}
