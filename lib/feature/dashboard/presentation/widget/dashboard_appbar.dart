import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/animated_search_bar.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final appBar = AppBar();
  final DashboardBloc _dashboardBloc;
  final Size _size;

  DashboardAppBar(this._dashboardBloc, this._size);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text(
        AppStrings.APP_NAME,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        AnimatedSearchBar(_dashboardBloc, _size),
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
