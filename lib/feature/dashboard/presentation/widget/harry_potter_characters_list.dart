import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/harry_potter_characters_list_item.dart';

class HarryPotterCharactersList extends StatelessWidget {
  final List<HarryPotterCharacter> _characters;
  final ScrollController _scrollController;

  HarryPotterCharactersList(this._characters, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _characters.length,
          itemBuilder: (context, index) {
            return Align(
                alignment: Alignment.topCenter,
                child: HarryPotterCharactersListItem(_characters[index]));
          }),
    );
  }
}
