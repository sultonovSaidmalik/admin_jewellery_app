import 'package:flutter/material.dart';
import '../../../common/styles/text_style.dart';
class WidgetsProductDescription extends StatelessWidget {
  final String name;
  final String description;
  final num price;
  const WidgetsProductDescription({super.key, required this.name, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Uzuk name
                 Text(
                   name,
                   style: Styles.w400,
                ),
              ],
            ),

            /// razmer
            Text(
              description,
               style: Styles.w300,
            ),
            const SizedBox(height: 15),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Text(
                  "$price  so'm",
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
