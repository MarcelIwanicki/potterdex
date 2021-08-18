import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';

class HarryPotterCharactersListPage extends StatelessWidget {
  final List<HarryPotterCharacter> _characters;
  HarryPotterCharactersListPage(this._characters);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _characters.length,
        itemBuilder: (context, index) {
          return Text(_characters[index].name);
        });
  }
}