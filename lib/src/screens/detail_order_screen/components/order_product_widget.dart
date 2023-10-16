import 'package:admin_jewellery_app/src/common/styles/text_style.dart';
import 'package:flutter/material.dart';

import '../../product_screen/components/product_description.dart';
import '../../product_screen/components/widgets_photos.dart';
import 'order_product.dart';

class OrderProductWidget extends StatelessWidget {
  final void Function() onTap;
  final String imageUrl;
  final String name;
  final num price;
  final num totalPrice;
  final num count;

  const OrderProductWidget({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.name,
    required this.price, required this.count, required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap,
            child:  Row(
              children: [
                /// Photo Jewellery
                WidgetsPhotos(
                  imageUrl: imageUrl,
                ),

                /// Description
                OrderProductDescription(
                  name: name,
                  price: price,
                  totalPrice: totalPrice,
                  count: count,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          /// Liner
          return Column(
            children: [
              const SizedBox(height: 15),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              const SizedBox(height: 15),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
