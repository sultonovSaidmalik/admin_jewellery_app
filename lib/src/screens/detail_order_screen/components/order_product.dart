import 'package:flutter/material.dart';
import '../../../common/styles/text_style.dart';

class OrderProductDescription extends StatelessWidget {
  final String name;
  final num price;
  final num totalPrice;
  final num count;

  const OrderProductDescription({
    super.key,
    required this.name,
    required this.price,
    required this.count, required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Name
            Text(
              "Name : $name",
              style: Styles.w700,
            ),
            const SizedBox(height: 3),
            /// Count Product
            Text(
              "Zakaz soni : $count",
              style: Styles.w700,
            ),
            const SizedBox(height: 3),
            /// Price
            Text(
              "Dona : $price  so'm",
              style: Styles.w700_20,
            ),
            const SizedBox(height: 3),
            /// Total Product
            Text(
              "Jami : $totalPrice  so'm",
              style: Styles.w700_20,
            ),
          ],
        ),
      ),
    );
  }
}
