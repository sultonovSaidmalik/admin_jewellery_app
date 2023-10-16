import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';

class UserListViewWidget extends StatelessWidget {
  final void Function() onTap;
  final String userName;
  final String userPhone;

  const UserListViewWidget({
    super.key,
    required this.onTap,
    required this.userName,
    required this.userPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: onTap,
            shape: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),

            /// User Avatar Images
            leading: const CircleAvatar(
              maxRadius: 40,
              backgroundColor: Colors.grey,
            ),

            /// User name
            title:  Text(
              userName,
              style: Styles.w700,
            ),

            /// User Phone
            subtitle:  Text(
              userPhone,
              style: Styles.w700,
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
