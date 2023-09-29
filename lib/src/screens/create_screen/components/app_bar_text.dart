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
