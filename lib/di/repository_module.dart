import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/data/dataprovider/harry_potter_api.dart';
import 'package:potterdex/feature/dashboard/data/repository/local/local_harry_potter_characters_database.dart';
import 'package:potterdex/feature/dashboard/data/repository/remote/harry_potter_characters_repository.dart';
import 'package:potterdex/feature/dashboard/data/repository/remote/harry_potter_characters_repository_api.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

const String DATABASE_NAME = 'local_harry_potter_characters_database';

void registerRepositoryModule() async {
  final injector = Injector.appInstance;

  injector.registerSingleton<HarryPotterAPI>((() => HarryPotterAPI()));

  injector.registerSingleton<HarryPotterCharactersRepositoryAPI>(
      () => HarryPotterCharactersRepository(injector.get<HarryPotterAPI>()));

  injector.registerSingleton<Future<LocalHarryPotterCharactersDatabase>>(() =>
      $FloorLocalHarryPotterCharactersDatabase
          .databaseBuilder(DATABASE_NAME)
          .build());

  injector.registerSingleton<HarryPotterCharactersService>(() =>
      HarryPotterCharactersService(
          localDatabase: injector.get(), remoteRepository: injector.get()));
}
