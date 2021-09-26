import 'package:injector/injector.dart';
import 'package:potterdex/feature/add/business_logic/add_character_cubit.dart';

void registerAddCharacterModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<AddCharacterCubit>(
      () => AddCharacterCubit(injector.get()));
}
