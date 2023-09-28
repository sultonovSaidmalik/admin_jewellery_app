import 'package:admin_jewellery_app/src/screens/create_screen/create_screen.dart';
import 'package:flutter/material.dart';
import '../product_screen/components/app_bar_text.dart';
import 'components/admin_widgets_list_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// appBar Text
              AppBarTextWidgets(),
              SizedBox(height: 15),

              /// Admin Product Widget
              AdminProductWidgets(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateScreens(),));
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add , color: Colors.white,),
      ),
    );
  }
}
