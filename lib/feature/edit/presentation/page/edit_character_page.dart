import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';
import 'package:potterdex/feature/details/presentation/widget/details_app_bar.dart';
import 'package:potterdex/feature/edit/business_logic/edit_character_cubit.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class EditCharacterPage extends StatefulWidget {
  final HarryPotterCharacter _harryPotterCharacter;

  const EditCharacterPage(this._harryPotterCharacter);

  @override
  _EditCharacterPageState createState() => _EditCharacterPageState();
}

class _EditCharacterPageState extends State<EditCharacterPage> {
  late EditCharacterCubit _editCharacterCubit;

  @override
  void initState() {
    _editCharacterCubit = BlocProvider.of<EditCharacterCubit>(context);
    _editCharacterCubit.initializeCubit(widget._harryPotterCharacter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            DetailsAppBar(widget._harryPotterCharacter,
                null, _editCharacterCubit, false),
            SliverFixedExtentList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDateButton(),
                      _buildGenderChipList(),
                    ],
                  ),
                  _buildHouseChipList(Icons.house),
                  _buildEyesColorTextField(),
                  _buildHairColorTextField(),
                  _buildPatronusTextField(),
                  _buildAncestryChipList(Icons.bloodtype),
                  _buildSpeciesTextField(),
                  _buildLifeConditionChipList(Icons.healing),
                  _buildHogwartsRoleChipList(Icons.book),
                  _buildActorTextField(),
                ]),
                itemExtent: 80.0),
          ],
        ),
      ),
    );
  }

  _buildHogwartsRoleChipList(IconData iconData) =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconData,
                color: Colors.grey,
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_HOGWARTS_ROLE_STUDENT),
                selected: state.hogwartsRole == "Student",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHogwartsRole("Student");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_HOGWARTS_ROLE_STAFF),
                selected: state.hogwartsRole == "Staff",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHogwartsRole("Staff");
                },
              ),
              ChoiceChip(
                label: Text("Not in Hogwarts"),
                selected: state.hogwartsRole == "Not in Hogwarts",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHogwartsRole("Not in Hogwarts");
                },
              ),
            ],
          );
        },
      );

  _buildLifeConditionChipList(IconData iconData) =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconData,
                color: Colors.grey,
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_LIFE_CONDITION_ALIVE),
                selected: state.lifeCondition == "Alive",
                onSelected: (bool selected) {
                  _editCharacterCubit.editLifeCondition("Alive");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_LIFE_CONDITION_DEAD),
                selected: state.lifeCondition == "Dead",
                onSelected: (bool selected) {
                  _editCharacterCubit.editLifeCondition("Dead");
                },
              ),
              ChoiceChip(
                label: Text("Other"),
                selected: state.lifeCondition == "Other",
                onSelected: (bool selected) {
                  _editCharacterCubit.editLifeCondition("Other");
                },
              ),
            ],
          );
        },
      );

  _buildAncestryChipList(IconData iconData) =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconData,
                color: Colors.grey,
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_PURE_BLOOD),
                selected: state.ancestry == "pure-blood",
                onSelected: (bool selected) {
                  _editCharacterCubit.editAncestry("pure-blood");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_HALF_BLOOD),
                selected: state.ancestry == "half-blood",
                onSelected: (bool selected) {
                  _editCharacterCubit.editAncestry("half-blood");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_MUGGLE_BORN),
                selected: state.ancestry == "muggle-born",
                onSelected: (bool selected) {
                  _editCharacterCubit.editAncestry("muggle-born");
                },
              )
            ],
          );
        },
      );

  _buildGenderChipList() => BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: [
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_FEMALE),
                selected: state.gender == "female" || state.gender == "Female",
                onSelected: (bool selected) {
                  _editCharacterCubit.editGender("female");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_MALE),
                selected: state.gender == "male" || state.gender == "Male",
                onSelected: (bool selected) {
                  _editCharacterCubit.editGender("male");
                },
              ),
            ],
          );
        },
      );

  _buildDateButton() => IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () {
          pickDate(context);
        },
      );

  Future pickDate(BuildContext context) async {
    final initialDate = _editCharacterCubit.birthDate;
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(DateTime.now().year + 5));

    if (newDate == null) {
      return;
    }

    _editCharacterCubit.editBirthDate(newDate);
  }

  _buildHouseChipList(IconData iconData) =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconData,
                color: Colors.grey,
              ),
              ChoiceChip(
                label:
                    Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_GRYFFINDOR),
                selected: state.house == "Gryffindor",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHouse("Gryffindor");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_SLYTHERIN),
                selected: state.house == "Slytherin",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHouse("Slytherin");
                },
              ),
              ChoiceChip(
                label:
                    Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_HUFFLEPUFF),
                selected: state.house == "Hufflepuff",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHouse("Hufflepuff");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_RAVENCLAW),
                selected: state.house == "Ravenclaw",
                onSelected: (bool selected) {
                  _editCharacterCubit.editHouse("Ravenclaw");
                },
              ),
            ],
          );
        },
      );

  _buildEyesColorTextField() =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.eyesColor,
            onChanged: (String eyesColor) {
              _editCharacterCubit.editEyesColor(eyesColor);
            },
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.visibility),
              labelText: AppStrings.DETAILS_EYES_COLOR,
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          );
        },
      );

  _buildHairColorTextField() =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.hairColor,
            onChanged: (String hairColor) {
              _editCharacterCubit.editHairColor(hairColor);
            },
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle_rounded),
              labelText: AppStrings.DETAILS_HAIR_COLOR,
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          );
        },
      );

  _buildPatronusTextField() =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.patronus,
            onChanged: (String patronus) {
              _editCharacterCubit.editPatronus(patronus);
            },
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.pets),
              labelText: AppStrings.DETAILS_PATRONUS,
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          );
        },
      );

  _buildSpeciesTextField() =>
      BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.species,
            onChanged: (String species) {
              _editCharacterCubit.editSpecies(species);
            },
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.accessibility_new_sharp),
              labelText: AppStrings.DETAILS_SPECIES,
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          );
        },
      );

  _buildActorTextField() => BlocBuilder<EditCharacterCubit, EditCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.actor,
            onChanged: (String actor) {
              _editCharacterCubit.editActor(actor);
            },
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.recent_actors),
              labelText: AppStrings.DETAILS_ACTOR,
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          );
        },
      );
}
