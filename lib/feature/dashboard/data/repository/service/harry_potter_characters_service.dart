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
        addHarryPotterCharacterToLocalDatabase(remoteCharacter);
      }
    });
  }

  Future<List<HarryPotterCharacter>>
      getHarryPotterCharactersFromInternet() async {
    return await remoteRepository.getHarryPotterCharacters();
  }

  Future<void> addHarryPotterCharacterToLocalDatabase(
      HarryPotterCharacter harryPotterCharacter) async {
    await localDatabase.then(
        (value) => {value.dao.addHarryPotterCharacter(harryPotterCharacter)});
  }

  Future<void> updateHarryPotterCharacterInLocalDatabase(
      HarryPotterCharacter harryPotterCharacter) async {
    await localDatabase.then((value) =>
        {value.dao.updateHarryPotterCharacter(harryPotterCharacter)});
  }

  Future<void> deleteHarryPotterCharacterFromLocalDatabase(int id) async {
    await localDatabase
        .then((value) => {value.dao.deleteHarryPotterCharacter(id)});
  }

  Future<List<HarryPotterCharacter>>
      getHarryPotterCharactersFromLocalDatabase() async {
    return await localDatabase
        .then((value) => value.dao.getAllHarryPotterCharacters());
  }

  Future<HarryPotterCharacter?> getHarryPotterCharacterByIdFromLocalDatabase(
      int id) async {
    return await localDatabase
        .then((value) => value.dao.getHarryPotterCharacterById(id).first);
  }

  Future<List<HarryPotterCharacter>>
      searchForHarryPotterCharactersInLocalDatabase(String query) async {
    final allCharacters = await getHarryPotterCharactersFromLocalDatabase();

    List<HarryPotterCharacter> searchedCharacters =
        allCharacters.where((e) => e.name.toLowerCase().trim().contains(query)).toList();

    return searchedCharacters;
  }
}
