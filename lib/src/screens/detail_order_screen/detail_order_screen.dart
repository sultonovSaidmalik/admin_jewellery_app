import 'package:flutter/material.dart';
import '../order_screen/components/app_bar.dart';
import 'components/order_product_widget.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// appBar Text
              AppBarTextWidgets(
                text: "Product",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 15),
              OrderProductWidget(
                onTap: (){},
                imageUrl: "",
                name: "Qwert",
                totalPrice: 150000000,
                price: 120000,
                count: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
