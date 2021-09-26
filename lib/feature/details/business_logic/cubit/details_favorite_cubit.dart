import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

class DetailsFavoriteCubit extends Cubit<bool> {
  final HarryPotterCharactersService service;

  DetailsFavoriteCubit(this.service) : super(false);

  void setFavorite(bool favorite) => emit(favorite);

  void revertFavoriteBoolean() => emit(!state);

  void updateDatabase(HarryPotterCharacter character) async {
    try {
      await service.updateHarryPotterCharacterInLocalDatabase(
          HarryPotterCharacter.clone(character, state));
    } catch (e) {}
  }
}
