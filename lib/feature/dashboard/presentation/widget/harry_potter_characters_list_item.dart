import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';
import 'package:transparent_image/transparent_image.dart';

class HarryPotterCharactersListItem extends StatelessWidget {
  final HarryPotterCharacter _character;

  HarryPotterCharactersListItem(this._character);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_HEIGHT,
      margin: const EdgeInsets.symmetric(
          horizontal:
              AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_HORIZONTAL_MARGIN,
          vertical:
              AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_VERTICAL_MARGIN),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_RADIUS)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(
                    AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_BLUR_ALPHA),
                blurRadius:
                    AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_BLUR_RADIUS),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:
                AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_HORIZONTAL_PADDING,
            vertical:
                AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_VERTICAL_PADDING),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _character.name,
                  style: const TextStyle(
                      fontSize: AppDimens
                          .HARRY_POTTER_CHARACTERS_LIST_ITEM_BIG_FONT_SIZE,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  _character.house,
                  style: const TextStyle(
                      fontSize:
                          AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_FONT_SIZE,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: AppDimens
                      .HARRY_POTTER_CHARACTERS_LIST_ITEM_SPACE_BETWEEN_TITLE_AND_INFO,
                ),
                Text(
                  "${AppStrings.HARRY_POTTER_CHARACTERS_LIST_ITEM_WAND_TEXT}: ${_character.wand.core},\n${_character.wand.length}\'\', ${_character.wand.wood}",
                  style: const TextStyle(
                      fontSize:
                          AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_FONT_SIZE,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _character.image,
              width: AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_IMAGE_WIDTH,
              height: AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_IMAGE_HEIGHT,
              imageCacheWidth: AppDimens
                  .HARRY_POTTER_CHARACTERS_LIST_ITEM_IMAGE_CACHED_HEIGHT,
            ),
          ],
        ),
      ),
    );
  }
}
