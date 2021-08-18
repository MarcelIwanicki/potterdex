import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/data/dataprovider/harry_potter_api.dart';
import 'package:potterdex/feature/dashboard/data/repository/harry_potter_repository.dart';

void registerRepositoryModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<HarryPotterAPI>((() => HarryPotterAPI()));

  injector.registerSingleton<HarryPotterRepository>(
      () => HarryPotterRepository(injector.get<HarryPotterAPI>()));
}
