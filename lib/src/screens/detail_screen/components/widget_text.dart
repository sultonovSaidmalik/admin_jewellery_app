import 'package:flutter/material.dart';

import '../../../common/models/product_model.dart';
import '../../../common/styles/text_style.dart';
class WidgetTexts extends StatelessWidget {
  final Product product;
  const WidgetTexts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Text Ring Name
          const Text(
            'Product name',
            style: Styles.w700_25,
          ),
          const SizedBox(height: 15),
           Row(
            children: [
              Text(
                '${product.productName}',
                style: Styles.w500_19,
              ),
            ],
          ),
          const SizedBox(height: 25),

          /// Explanation Text
          const Text(
            'Description',
            style: Styles.w700_25,
          ),
          const SizedBox(height: 15),

          /// Description

          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 0.4,
            child:  SingleChildScrollView(
              child: Text(
                "${product.productDescription}",
                overflow: TextOverflow.visible,
                style: Styles.w400,
              ),
            ),
          ),

          ///Price and Texts

           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: Styles.w700_25,
              ),
              Text(
                "${(product.productPrice ?? 0)} so'm",
                style: Styles.w700_28,
              )
            ],
          ),
        ],
      ),
    );
  }
}
