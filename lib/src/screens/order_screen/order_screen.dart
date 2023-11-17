import 'package:admin_jewellery_app/src/screens/bloc/order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../detail_order_screen/detail_order_screen.dart';
import 'components/app_bar.dart';
import 'components/user_list_view_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  void didChangeDependencies() {
    context.read<OrderBloc>().add(GetOrderEvent());
    super.didChangeDependencies();
  }
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
                text: "Order Product",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 15),
              UserListViewWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailOrderScreen(),
                    ),
                  );
                },
                userName: "Sarvar",
                userPhone: "+998998288480",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
