import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/categories_scroller_item.dart';
import 'package:potterdex/resources/values/app_colors.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height *
        AppDimens.CATEGORIES_SCROLLER_HEIGHT_MULTIPLIER;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: AppDimens.CATEGORIES_SCROLLER_MARGIN,
            horizontal: AppDimens.CATEGORIES_SCROLLER_MARGIN),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: Row(
              children: <Widget>[
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_A,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_B,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: Theme.of(context).accentColor,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_C,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: Theme.of(context).accentColor,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_D,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: Theme.of(context).accentColor,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_E,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: AppColors.GRYFFINDOR_PRIMARY_COLOR,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_F,
                  countItems: 20,
                  fontColor: Colors.black,
                  backgroundColor: AppColors.HUFFLEPUFF_PRIMARY_COLOR,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_G,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: AppColors.SLYTHERIN_PRIMARY_COLOR,
                ),
                CategoriesScrollerItem(
                  width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                  height: categoryHeight,
                  title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_H,
                  countItems: 20,
                  fontColor: Colors.white,
                  backgroundColor: AppColors.RAVENCLAW_PRIMARY_COLOR,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
