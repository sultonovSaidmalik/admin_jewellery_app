import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';
class WidgetTexts extends StatelessWidget {
  const WidgetTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Text Ring Name
          const Row(
            children: [
              Text(
                '2,99 Carat Diamond\nRing',
                style: Styles.w700,
              ),
            ],
          ),
          const SizedBox(height: 25),

          /// Explanation Text
          const Text(
            'Explanation',
            style: Styles.w500_19,
          ),
          const SizedBox(height: 15),

          /// Description

          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 0.4,
            child: const SingleChildScrollView(
              child: Text(
                'Natural diamond mine turns into a more sparkling "diamond" when cut in a special form with a larger cut surface and a dome-like bottom. The difference between diamond and diamond is that diamond has less cut surface and the lower part is flat.',
                overflow: TextOverflow.visible,
                style: Styles.w400,
              ),
            ),
          ),

          ///Price and Texts

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: Styles.w400_20,
              ),
              Text(
                '10.750 ₺',
                style: Styles.w700_28,
              )
            ],
          ),
        ],
      ),
    );
  }
}
