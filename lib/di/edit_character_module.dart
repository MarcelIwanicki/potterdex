import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/edit/business_logic/edit_character_cubit.dart';

void registerEditCharacterModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<EditCharacterCubit>(
      () => EditCharacterCubit(injector.get(), HarryPotterCharacter.empty()));
}
