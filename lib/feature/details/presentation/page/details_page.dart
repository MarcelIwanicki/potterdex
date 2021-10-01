import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/details/business_logic/bloc/details_bloc.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';
import 'package:potterdex/feature/details/presentation/widget/details_app_bar.dart';
import 'package:potterdex/feature/details/presentation/widget/details_item_list.dart';

class DetailsPage extends StatefulWidget {
  final int _characterId;

  DetailsPage(this._characterId);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsBloc detailsBloc;
  late DetailsFavoriteCubit detailsFavoriteCubit;

  @override
  void initState() {
    super.initState();
    detailsBloc = BlocProvider.of<DetailsBloc>(context);
    detailsBloc.initId(widget._characterId);
    detailsBloc.add(GetHarryPotterCharacterDetailsEvent());

    detailsFavoriteCubit = BlocProvider.of<DetailsFavoriteCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                HarryPotterCharacter character = HarryPotterCharacter.empty();
                if (state is HarryPotterCharacterIsLoadedState) {
                  character = state.getCharacter;
                  detailsFavoriteCubit.setFavorite(character.favorite);
                }
                return DetailsAppBar(character, detailsFavoriteCubit, null, true);
              },
            ),
            BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                HarryPotterCharacter character = HarryPotterCharacter.empty();

                if (state is HarryPotterCharacterIsLoadedState) {
                  character = state.getCharacter;
                }
                return DetailsItemList(character);
              },
            )
          ],
        ),
      ),
    );
  }
}
