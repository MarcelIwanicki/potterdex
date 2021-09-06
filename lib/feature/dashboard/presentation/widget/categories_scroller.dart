import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/categories_scroller_item.dart';
import 'package:potterdex/resources/values/app_colors.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class CategoriesScroller extends StatelessWidget {
  final DashboardBloc _dashboardBloc;

  const CategoriesScroller(this._dashboardBloc);

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
                GestureDetector(
                  onTap: () {
                    _dashboardBloc
                        .add(GetHarryPotterCharactersDashboardEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_ALL_ITEMS,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_ALL_ITEMS_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardByFavoriteEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_FAVORITES,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_FAVORITES_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardByHumanEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_HUMAN,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_HUMAN_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardByFemaleEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_FEMALE,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_FEMALE_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc
                        .add(FilterHarryPotterCharactersDashboardByMaleEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_MALE,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_MALE_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardByGryffindorEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_GRYFFINDOR,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_GRYFFINDOR_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: AppColors.GRYFFINDOR_PRIMARY_COLOR,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardByHufflepuffEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_HUFFLEPUFF,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_HUFFLEPUFF_DESCRIPTION,
                    fontColor: Colors.black,
                    backgroundColor: AppColors.HUFFLEPUFF_PRIMARY_COLOR,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardBySlytherinEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_SLYTHERIN,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_SLYTHERIN_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: AppColors.SLYTHERIN_PRIMARY_COLOR,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _dashboardBloc.add(
                        FilterHarryPotterCharactersDashboardByRavenclawEvent());
                  },
                  child: CategoriesScrollerItem(
                    width: AppDimens.CATEGORIES_SCROLLER_ITEM_WIDTH,
                    height: categoryHeight,
                    title: AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_RAVENCLAW,
                    description: AppStrings
                        .CATEGORIES_SCROLLER_ITEM_NAME_RAVENCLAW_DESCRIPTION,
                    fontColor: Colors.white,
                    backgroundColor: AppColors.RAVENCLAW_PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
