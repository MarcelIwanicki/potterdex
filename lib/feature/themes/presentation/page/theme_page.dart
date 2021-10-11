import 'package:flutter/material.dart';
import 'package:potterdex/preferences/theme_notifier.dart';
import 'package:potterdex/preferences/theme_preferences.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';
import 'package:provider/provider.dart';

const GRYFFINDOR_SRC = 'assets/gryffindor.png';
const SLYTHERIN_SRC = 'assets/slytherin.png';
const HUFFLEPUFF_SRC = 'assets/hufflepuff.png';
const RAVENCLAW_SRC = 'assets/ravenclaw.png';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(
                AppStrings.SIDE_DRAWER_THEMES,
                style: TextStyle(
                    fontSize: AppDimens.CATEGORIES_SCROLLER_ITEM_BIG_FONT_SIZE,
                    color: Colors.white),
              ),
              expandedHeight: AppDimens.DETAILS_EXPANDED_HEIGHT / 1.4,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                color: Theme.of(context).primaryColor,
              )),
            ),
            _buildGridView(themeNotifier),
          ],
        );
      },
    ));
  }

  _buildGridView(ThemeNotifier themeNotifier) => SliverGrid.count(
        crossAxisCount: 2,
        children: [
          IconButton(
              onPressed: () {
                themeNotifier.theme = PotterdexTheme.GRYFFINDOR;
              },
              icon: Image.asset(GRYFFINDOR_SRC)),
          IconButton(
              onPressed: () {
                themeNotifier.theme = PotterdexTheme.SLYTHERIN;
              },
              icon: Image.asset(SLYTHERIN_SRC)),
          IconButton(
              onPressed: () {
                themeNotifier.theme = PotterdexTheme.HUFFLEPUFF;
              },
              icon: Image.asset(HUFFLEPUFF_SRC)),
          IconButton(
              onPressed: () {
                themeNotifier.theme = PotterdexTheme.RAVENCLAW;
              },
              icon: Image.asset(RAVENCLAW_SRC)),
          IconButton(onPressed: () {}, icon: Icon(Icons.light_mode)),
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        ],
      );
}
