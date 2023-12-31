import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';

class AppBarTextWidgets extends StatelessWidget {
  final void Function()? onPressed;
  const AppBarTextWidgets({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      /// Screen Name
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Admin Product",
            style: Styles.w700_25,
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
