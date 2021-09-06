import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class DetailsItemList extends StatelessWidget {
  final HarryPotterCharacter _character;

  DetailsItemList(this._character);

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
        delegate: SliverChildListDelegate([
          Center(
            child: ListTile(
              leading: Icon(Icons.house),
              title: Text(AppStrings.DETAILS_HOUSE_TEXT),
              subtitle: Text(_character.house.isNotEmpty
                  ? _character.house
                  : AppStrings.APP_UNKNOWN),
            ),
          ),
          Center(
            child: ListTile(
              leading: _character.gender == "female"
                  ? Icon(Icons.female)
                  : Icon(Icons.male),
              title: Text(AppStrings.DETAILS_GENDER),
              subtitle: Text(_character.gender),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(AppStrings.DETAILS_BIRTH_DATE),
              subtitle:
                  Text("${_character.yearOfBirth} / ${_character.dateOfBirth}"),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.visibility),
              title: Text(AppStrings.DETAILS_EYES_COLOR),
              subtitle: Text(_character.eyeColour),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: Text(AppStrings.DETAILS_HAIR_COLOR),
              subtitle: Text(_character.hairColour),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.brush),
              title: Text(AppStrings.DETAILS_WAND),
              subtitle: Text(
                  "${_character.wandWood} ${_character.wandCore} ${_character.wandLength}\""),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.pets),
              title: Text(AppStrings.DETAILS_PATRONUS),
              subtitle: Text(_character.patronus),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.bloodtype),
              title: Text(AppStrings.DETAILS_ANCESTRY),
              subtitle: Text(_character.ancestry),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.accessibility_new_sharp),
              title: Text(AppStrings.DETAILS_SPECIES),
              subtitle: Text(_character.species),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.healing),
              title: Text(AppStrings.DETAILS_LIFE_CONDITION),
              subtitle: Text(
                  "${_character.alive ? AppStrings.DETAILS_LIFE_CONDITION_ALIVE : AppStrings.DETAILS_LIFE_CONDITION_DEAD}"),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text(AppStrings.DETAILS_HOGWARTS_ROLE),
              subtitle: Text(
                  "${_character.hogwartsStaff ? AppStrings.DETAILS_HOGWARTS_ROLE_STAFF : ""}${_character.hogwartsStudent ? AppStrings.DETAILS_HOGWARTS_ROLE_STUDENT : ""}"),
            ),
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.recent_actors),
              title: Text(AppStrings.DETAILS_ACTOR),
              subtitle: Text(_character.actor),
            ),
          ),
        ]),
        itemExtent: AppDimens.DETAILS_ITEM_EXTENT);
  }
}
