import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/presentation/page/dashboard_page.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';
import 'package:potterdex/feature/details/presentation/page/details_page.dart';
import 'package:potterdex/feature/edit/business_logic/edit_character_cubit.dart';
import 'package:potterdex/feature/edit/presentation/page/edit_character_page.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsAppBar extends StatefulWidget {
  final HarryPotterCharacter _character;
  final DetailsFavoriteCubit? _detailsFavoriteCubit;
  final EditCharacterCubit? _editCharacterCubit;
  final bool editable;

  DetailsAppBar(this._character, this._detailsFavoriteCubit,
      this._editCharacterCubit, this.editable);

  @override
  _DetailsAppBarState createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(widget._character.name),
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: AppDimens.DETAILS_EXPANDED_HEIGHT,
      actions: [
        Visibility(
            visible: !widget.editable,
            child: IconButton(
              onPressed: () {
                widget._editCharacterCubit
                    ?.editHarryPotterCharacterInLocalDatabase();
                Navigator.pop(context);
              },
              icon: Icon(Icons.check),
              color: Colors.greenAccent,
            )),
        Visibility(
          visible: widget.editable,
          child: IconButton(
              onPressed: () async {
                await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditCharacterPage(widget._character)))
                    .then((_) => _resetWidgets());
              },
              icon: Icon(Icons.edit)),
        ),
        Visibility(
            visible: !widget.editable,
            child: IconButton(
                onPressed: () async {
                  widget._editCharacterCubit?.deleteCharacter();
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DashboardPage(),
                    ),
                    (route) => false,
                  );
                },
                icon: Icon(Icons.delete))),
        Visibility(
          visible: widget.editable,
          child: IconButton(onPressed: () {
            widget._detailsFavoriteCubit?.revertFavoriteBoolean();
            widget._detailsFavoriteCubit?.updateDatabase(widget._character);
          }, icon: BlocBuilder<DetailsFavoriteCubit, bool>(
            builder: (context, state) {
              return state
                  ? Icon(Icons.favorite, color: Colors.redAccent)
                  : Icon(Icons.favorite_border, color: Colors.redAccent);
            },
          )),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: widget._character.image.isNotEmpty
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget._character.image,
                fit: BoxFit.cover,
              )
            : FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: HarryPotterCharacter.DEFAULT_OFFLINE_IMAGE,
                width: AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_IMAGE_WIDTH,
                height:
                    AppDimens.HARRY_POTTER_CHARACTERS_LIST_ITEM_IMAGE_HEIGHT,
                imageCacheWidth: AppDimens
                    .HARRY_POTTER_CHARACTERS_LIST_ITEM_IMAGE_CACHED_HEIGHT),
      ),
    );
  }

  void _resetWidgets() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (_, __, ___) => DetailsPage(widget._character.id)));
  }
}
