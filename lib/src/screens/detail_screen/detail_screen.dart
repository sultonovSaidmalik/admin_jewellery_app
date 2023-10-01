import 'package:flutter/material.dart';
import 'components/back_and_page_view_button.dart';
import 'components/share_buttons.dart';
import 'components/widget_text.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Stack(
            children: [
              /// PageView Images
              WidgetPageView(),
              /// Share Buttons and Back button
              ShareAndBackButton(),
            ],
          ),
          /// Texts Product Texts
          WidgetTexts(),
        ],
      ),
    );
  }
}
