import 'package:flutter/material.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class CategoriesScrollerItem extends StatelessWidget {
  final double width;
  final double height;
  final title;
  final countItems;
  final backgroundColor;
  final fontColor;

  CategoriesScrollerItem(
      {required this.width,
      required this.height,
      this.title,
      this.countItems,
      this.backgroundColor,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(
          right: AppDimens.CATEGORIES_SCROLLER_ITEM_RIGHT_MARGIN),
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.CATEGORIES_SCROLLER_ITEM_RADIUS))),
      child: Padding(
        padding:
            const EdgeInsets.all(AppDimens.CATEGORIES_SCROLLER_ITEM_PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: AppDimens.CATEGORIES_SCROLLER_ITEM_BIG_FONT_SIZE,
                  color: fontColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: AppDimens.CATEGORIES_SCROLLER_ITEM_SPACE_BETWEEN_TEXTS,
            ),
            Text(
              "$countItems ${AppStrings.CATEGORIES_SCROLLER_ITEM_COUNT_TEXT}",
              style: TextStyle(
                  fontSize: AppDimens.CATEGORIES_SCROLLER_ITEM_FONT_SIZE,
                  color: fontColor),
            ),
          ],
        ),
      ),
    );
  }
}
