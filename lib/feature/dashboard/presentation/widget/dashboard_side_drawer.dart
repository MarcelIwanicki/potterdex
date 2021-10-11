import 'package:flutter/material.dart';
import 'package:potterdex/feature/themes/presentation/page/theme_page.dart';
import 'package:potterdex/resources/values/app_strings.dart';

const BACKGROUND_SRC = 'assets/background.jpg';

class DashboardSideDrawer extends StatelessWidget {
  const DashboardSideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(BACKGROUND_SRC),
                  fit: BoxFit.fill,
                ),
              ),
              child: SizedBox()),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.SIDE_DRAWER_THEMES),
                Icon(Icons.style)
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThemePage()));
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.SIDE_DRAWER_SETTINGS),
                Icon(Icons.settings)
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
