import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';

class AppBarTextWidgets extends StatelessWidget {
  const AppBarTextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Expanded(
      /// Screen Name
      child: Text(
         "Create Product",
         style:  Styles.w700_25,
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
    );
  }
}

