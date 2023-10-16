import 'package:admin_jewellery_app/src/common/models/product_model.dart';
import 'package:flutter/material.dart';
import 'components/back_and_page_view_button.dart';
import 'components/share_buttons.dart';
import 'components/widget_text.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              /// PageView Images
              WidgetPageView(
                product: widget.product,
              ),

              /// Share Buttons and Back button
              const ShareAndBackButton(),
            ],
          ),

          /// Texts Product Texts
          WidgetTexts(
            product: widget.product,
          ),
        ],
      ),
    );
  }
}
