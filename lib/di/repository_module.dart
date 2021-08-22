import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/data/dataprovider/harry_potter_api.dart';
import 'package:potterdex/feature/dashboard/data/repository/remote/harry_potter_characters_repository.dart';

void registerRepositoryModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<HarryPotterAPI>((() => HarryPotterAPI()));

  injector.registerSingleton<HarryPotterCharactersRepository>(
      () => HarryPotterCharactersRepository(injector.get<HarryPotterAPI>()));
}
