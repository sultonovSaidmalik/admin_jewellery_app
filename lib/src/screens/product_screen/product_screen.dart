import 'package:admin_jewellery_app/src/common/utils/utils.dart';
import 'package:admin_jewellery_app/src/screens/bloc/product_bloc/product_bloc.dart';
import 'package:admin_jewellery_app/src/screens/create_screen/create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_screen/components/app_bar_text.dart';
import 'components/admin_widgets_list_view.dart';

part './mixin/product_mixin.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key,});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with ProductMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductMainState>(
      listener: listener,
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body:  const SafeArea(
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
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => const CreateScreens(),
            ));
          },
          backgroundColor: Colors.grey,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
