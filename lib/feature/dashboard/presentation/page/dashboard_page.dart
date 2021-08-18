import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/categories_scroller.dart';

import 'harry_potter_characters_list_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    final Size size = MediaQuery.of(context).size;

    dashboardBloc.add(GetHarryPotterCharactersEvent());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Potterdex',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: Icon(Icons.menu, color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                )),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              categoriesScroller,
              BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                if (state is DashboardInitialState) {
                  return Text("initial");
                } else if (state is HarryPotterCharactersAreLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HarryPotterCharactersAreLoadedState) {
                  return HarryPotterCharactersListPage(state.getCharacters);
                }
                return Text("none");
              })
            ],
          ),
        ),
      ),
    );
  }
}
