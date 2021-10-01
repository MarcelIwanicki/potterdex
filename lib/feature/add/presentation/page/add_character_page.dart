import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/add/business_logic/add_character_cubit.dart';
import 'package:potterdex/feature/add/presentation/widget/add_character_bezier_clipper.dart';
import 'package:potterdex/feature/add/presentation/widget/add_character_fields.dart';

class AddCharacterPage extends StatefulWidget {
  const AddCharacterPage({Key? key}) : super(key: key);

  @override
  _AddCharacterPageState createState() => _AddCharacterPageState();
}

class _AddCharacterPageState extends State<AddCharacterPage> {
  late AddCharacterCubit addCharacterCubit;

  @override
  void initState() {
    super.initState();
    addCharacterCubit = BlocProvider.of<AddCharacterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _buildTitle(),
          elevation: 0,
        ),
        body: Column(
          children: [
            _buildBezierAppBar(),
            EditCharacterFields(addCharacterCubit, true),
            _buildBottomBar()
          ],
        ));
  }

  _buildBezierAppBar() {
    final double height = MediaQuery.of(context).size.height * 0.2;

    return ClipPath(
      clipper: AddCharacterBezierClipper(),
      child: Container(
        color: Theme.of(context).primaryColor,
        height: height,
      ),
    );
  }

  _buildTitle() => Text(
        "Add character",
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w300,
            letterSpacing: 3),
        textAlign: TextAlign.center,
      );

  _buildBottomBar() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildClearButton(),
            _buildConfirmButton(),
          ],
        ),
      );

  _buildClearButton() => TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
        ),
        onPressed: () {
          addCharacterCubit.clearData();
          _resetWidgets();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "CLEAR",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildConfirmButton() => TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        onPressed: () {
          addCharacterCubit.addHarryPotterCharacterToLocalDatabase();
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "CONFIRM",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  void _resetWidgets() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (_, __, ___) => AddCharacterPage()));
  }
}
