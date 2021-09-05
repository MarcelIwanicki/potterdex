import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/local/local_harry_potter_characters_database.dart';
import 'package:potterdex/feature/dashboard/data/repository/remote/harry_potter_characters_repository_api.dart';

class HarryPotterCharactersService {
  final Future<LocalHarryPotterCharactersDatabase> localDatabase;
  final HarryPotterCharactersRepositoryAPI remoteRepository;

  HarryPotterCharactersService(
      {required this.localDatabase, required this.remoteRepository});

  Future<void> loadHarryPotterCharactersFromRemoteToLocalDatabase() async {
    final remoteHarryPotterCharacters =
        await getHarryPotterCharactersFromInternet();
    final localHarryPotterCharacters =
        await getHarryPotterCharactersFromLocalDatabase();

    remoteHarryPotterCharacters.forEach((remoteCharacter) {
      if (!localHarryPotterCharacters.contains(remoteCharacter)) {
        addHarryPotterCharacterToLocalRepository(remoteCharacter);
      }
    });
  }

  Future<List<HarryPotterCharacter>>
      getHarryPotterCharactersFromInternet() async {
    return await remoteRepository.getHarryPotterCharacters();
  }

  Future<void> addHarryPotterCharacterToLocalRepository(
      HarryPotterCharacter harryPotterCharacter) async {
    await localDatabase.then(
        (value) => {value.dao.addHarryPotterCharacter(harryPotterCharacter)});
  }

  Future<List<HarryPotterCharacter>>
      getHarryPotterCharactersFromLocalDatabase() async {
    return await localDatabase
        .then((value) => value.dao.getAllHarryPotterCharacters());
  }

  Stream<HarryPotterCharacter?> getHarryPotterCharacterByIdFromLocalDatabase(
      int id) async* {
    await localDatabase.then((value) async* {
      yield value.dao.getHarryPotterCharacterById(id);
    });
  }
}
