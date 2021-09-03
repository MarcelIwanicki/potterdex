import 'package:floor/floor.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';

@dao
abstract class LocalHarryPotterCharactersDao {
  @Query('SELECT * FROM HarryPotterCharacter')
  Future<List<HarryPotterCharacter>> getAllHarryPotterCharacters();

  @Query('SELECT * FROM HarryPotterCharacter WHERE id = :id')
  Stream<HarryPotterCharacter?> getHarryPotterCharacterById(int id);

  @insert
  Future<void> addHarryPotterCharacter(
      HarryPotterCharacter harryPotterCharacter);
}
