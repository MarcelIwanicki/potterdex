import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsAppBar extends StatelessWidget {
  final HarryPotterCharacter _character;
  final DetailsFavoriteCubit _detailsFavoriteCubit;

  DetailsAppBar(this._character, this._detailsFavoriteCubit);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(_character.name),
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: AppDimens.DETAILS_EXPANDED_HEIGHT,
      actions: [
        IconButton(onPressed: () {
          _detailsFavoriteCubit.revertFavoriteBoolean();
          _detailsFavoriteCubit.updateDatabase(_character);
        }, icon: BlocBuilder<DetailsFavoriteCubit, bool>(
          builder: (context, state) {
            return state
                ? Icon(Icons.favorite, color: Colors.redAccent)
                : Icon(Icons.favorite_border, color: Colors.redAccent);
          },
        ))
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: _character.image,
        fit: BoxFit.cover,
      )),
    );
  }
}
