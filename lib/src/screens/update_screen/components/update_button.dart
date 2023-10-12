import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';
class UpdateButton extends StatelessWidget {
  final void Function() onPressed;
  const UpdateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        onPressed: onPressed,
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white.withOpacity(0.4)),
          ),
          child: const Center(
            child: Text(
              "Update",
              style: Styles.create,
            ),
          ),
        ),
      ),
    );
  }
}
