import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/add/business_logic/add_character_cubit.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class EditCharacterFields extends StatefulWidget {
  final AddCharacterCubit addCharacterCubit;
  final bool editableName;

  const EditCharacterFields(this.addCharacterCubit, this.editableName);

  @override
  _EditCharacterFieldsState createState() => _EditCharacterFieldsState();
}

class _EditCharacterFieldsState extends State<EditCharacterFields> {
  @override
  Widget build(BuildContext context) {
    return _buildEditFields();
  }

  _buildEditFields() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDateButton(),
                    _buildGenderChipList(),
                  ],
                ),
                _buildNameTextField(),
                _buildHouseChipList(Icons.house),
                _buildEyesColorTextField(),
                _buildHairColorTextField(),
                _buildPatronusTextField(),
                _buildAncestryChipList(Icons.bloodtype),
                _buildSpeciesTextField(),
                _buildLifeConditionChipList(Icons.healing),
                _buildHogwartsRoleChipList(Icons.book),
                _buildActorTextField(),
              ],
            ),
          ),
        ),
      );

  _buildHogwartsRoleChipList(IconData iconData) =>
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
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
                  widget.addCharacterCubit.editHogwartsRole("Student");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_HOGWARTS_ROLE_STAFF),
                selected: state.hogwartsRole == "Staff",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editHogwartsRole("Staff");
                },
              ),
              ChoiceChip(
                label: Text("Not in Hogwarts"),
                selected: state.hogwartsRole == "Not in Hogwarts",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editHogwartsRole("Not in Hogwarts");
                },
              ),
            ],
          );
        },
      );

  _buildLifeConditionChipList(IconData iconData) =>
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
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
                  widget.addCharacterCubit.editLifeCondition("Alive");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_LIFE_CONDITION_DEAD),
                selected: state.lifeCondition == "Dead",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editLifeCondition("Dead");
                },
              ),
              ChoiceChip(
                label: Text("Other"),
                selected: state.lifeCondition == "Other",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editLifeCondition("Other");
                },
              ),
            ],
          );
        },
      );

  _buildAncestryChipList(IconData iconData) =>
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
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
                  widget.addCharacterCubit.editAncestry("pure-blood");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_HALF_BLOOD),
                selected: state.ancestry == "half-blood",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editAncestry("half-blood");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.DETAILS_MUGGLE_BORN),
                selected: state.ancestry == "muggle-born",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editAncestry("muggle-born");
                },
              )
            ],
          );
        },
      );

  _buildGenderChipList() => BlocBuilder<AddCharacterCubit, AddCharacterState>(
        builder: (context, state) {
          return Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: [
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_FEMALE),
                selected: state.gender == "female",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editGender("female");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_MALE),
                selected: state.gender == "male",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editGender("male");
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
    final initialDate = widget.addCharacterCubit.birthDate;
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(DateTime.now().year + 5));

    if (newDate == null) {
      return;
    }

    widget.addCharacterCubit.editBirthDate(newDate);
  }

  _buildHouseChipList(IconData iconData) =>
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
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
                  widget.addCharacterCubit.editHouse("Gryffindor");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_SLYTHERIN),
                selected: state.house == "Slytherin",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editHouse("Slytherin");
                },
              ),
              ChoiceChip(
                label:
                    Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_HUFFLEPUFF),
                selected: state.house == "Hufflepuff",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editHouse("Hufflepuff");
                },
              ),
              ChoiceChip(
                label: Text(AppStrings.CATEGORIES_SCROLLER_ITEM_NAME_RAVENCLAW),
                selected: state.house == "Ravenclaw",
                onSelected: (bool selected) {
                  widget.addCharacterCubit.editHouse("Ravenclaw");
                },
              ),
            ],
          );
        },
      );

  _buildNameTextField() => Visibility(
        visible: widget.editableName,
        child: BlocBuilder<AddCharacterCubit, AddCharacterState>(
          builder: (context, state) {
            return TextFormField(
              initialValue: state.name,
              onChanged: (String name) {
                widget.addCharacterCubit.editName(name);
              },
              maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(Icons.drive_file_rename_outline),
                labelText: "Character full name",
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
        ),
      );

  _buildEyesColorTextField() =>
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.eyesColor,
            onChanged: (String eyesColor) {
              widget.addCharacterCubit.editEyesColor(eyesColor);
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
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.hairColor,
            onChanged: (String hairColor) {
              widget.addCharacterCubit.editHairColor(hairColor);
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
      BlocBuilder<AddCharacterCubit, AddCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.patronus,
            onChanged: (String patronus) {
              widget.addCharacterCubit.editPatronus(patronus);
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

  _buildSpeciesTextField() => BlocBuilder<AddCharacterCubit, AddCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.species,
            onChanged: (String species) {
              widget.addCharacterCubit.editSpecies(species);
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

  _buildActorTextField() => BlocBuilder<AddCharacterCubit, AddCharacterState>(
        builder: (context, state) {
          return TextFormField(
            initialValue: state.actor,
            onChanged: (String actor) {
              widget.addCharacterCubit.editActor(actor);
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
