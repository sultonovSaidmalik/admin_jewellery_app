import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../detail_screen/detail_screen.dart';
import 'product_description.dart';
import 'widgets_photos.dart';

class AdminProductWidgets extends StatelessWidget {
  const AdminProductWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailScreen(),
                ),
              );
            },
            child: ProductWidget(
              onPress: (){},
              widget: const Row(
                children: [
                  /// Photo Jewellery
                  WidgetsPhotos(),

                  /// Description
                  WidgetsProductDescription(),
                ],
              ),
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

class ProductWidget extends StatelessWidget {
  final void Function() onPress;
  final Widget widget;

  const ProductWidget({
    super.key,
    required this.onPress,
    required this.widget,
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
            onPressed: (e) {},
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
            onPressed: (e) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: widget
    );
  }
}
