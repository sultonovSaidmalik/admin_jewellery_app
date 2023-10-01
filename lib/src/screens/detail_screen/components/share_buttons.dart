import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'back_and_page_view_button.dart';

class ShareButtons extends StatelessWidget {
  const ShareButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Image(
            image: AssetImage("assets/icons/ic_share.png"),
          ),
        ),
      ),
    );
  }
}

class ShareAndBackButton extends StatelessWidget {
  const ShareAndBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Back button

        Padding(
          padding: EdgeInsets.only(top: 40),
          child: MyBackButton(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, right: 20),

          ///Share Buttons
          child: ShareButtons(),
        )
      ],
    );
  }
}
