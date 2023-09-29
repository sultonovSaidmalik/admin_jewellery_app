import 'package:flutter/material.dart';
import '../../../common/styles/text_style.dart';
class WidgetsProductDescription extends StatelessWidget {
  const WidgetsProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Uzuk name
                 Text(
                   "2,99 Carat Diamond Ring",
                   style: Styles.w400,
                ),
              ],
            ),

            /// razmer
            Text(
              "Boyut: 3.5",
               style: Styles.w300,
            ),
            SizedBox(height: 15),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Text(
                  "10.750 ₺",
                  style: Styles.w700_20,
                ),

                // /// Add To Basket
                // ButtonAddToBasket(onTap: (){},),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
