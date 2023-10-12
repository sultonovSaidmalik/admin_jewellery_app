import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../common/models/product_model.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import '../../detail_screen/detail_screen.dart';
import '../../update_screen/update_screen.dart';
import 'product_description.dart';
import 'widgets_photos.dart';

class AdminProductWidgets extends StatelessWidget {
  const AdminProductWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: BlocBuilder<ProductBloc, ProductMainState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final product = state.products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        product: product,
                      ),
                    ),
                  );
                },
                child: ProductWidget(
                  onPress: () {},
                  widget: Row(
                    children: [
                      /// Photo Jewellery
                      WidgetsPhotos(
                        imageUrl: product.images[0],
                      ),

                      /// Description
                      WidgetsProductDescription(
                        name: product.productName ?? "",
                        description: product.productDescription ?? "",
                        price: product.productPrice ?? 0,
                      ),
                    ],
                  ),
                  deletePress: () {
                    context.read<ProductBloc>().add(
                        ProductDeleteEvent(productId: product.productId ?? ""));
                  },
                  updatePress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateScreen(product: product),
                      ),
                    );
                  },
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
            itemCount: state.products.length,
          );
        },
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final void Function() onPress;
  final void Function() deletePress;
  final void Function() updatePress;
  final Widget widget;

  const ProductWidget({
    super.key,
    required this.onPress,
    required this.widget,
    required this.deletePress,
    required this.updatePress,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              spacing: 5,
              flex: 1,
              onPressed: (e) => deletePress(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              spacing: 5,
              flex: 1,
              onPressed: (e) => updatePress(),
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: widget);
  }
}
