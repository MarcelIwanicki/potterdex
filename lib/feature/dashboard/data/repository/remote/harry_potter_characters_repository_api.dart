
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';

abstract class HarryPotterCharactersRepositoryAPI {
  Future<List<HarryPotterCharacter>> getHarryPotterCharacters();
}