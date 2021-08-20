import 'package:flutter/material.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final appBar = AppBar();

  DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text(
        AppStrings.APP_NAME,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Icon(Icons.menu, color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.black,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
