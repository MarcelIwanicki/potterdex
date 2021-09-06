import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';

import '../../../dashboard/repository/service/mock_harry_potter_characters_service.dart';

void main() {
  group('DetailsFavoriteCubit', () {
    late DetailsFavoriteCubit detailsFavoriteCubit;

    setUp(() {
      detailsFavoriteCubit =
          DetailsFavoriteCubit(MockHarryPotterCharactersService());
    });

    tearDown(() {
      detailsFavoriteCubit.close();
    });

    test('the initial state for the DetailsFavoriteCubit is false)', () {
      expect(detailsFavoriteCubit.state, false);
    });

    blocTest<DetailsFavoriteCubit, bool>(
      'the cubit should emit true'
      'when cubit.setFavorite is called'
      'and favorite is true',
      build: () => detailsFavoriteCubit,
      act: (cubit) => cubit.setFavorite(true),
      expect: () => [true],
    );

    blocTest<DetailsFavoriteCubit, bool>(
      'the cubit should emit false'
      'when cubit.setFavorite is called'
      'and favorite is false',
      build: () => detailsFavoriteCubit,
      act: (cubit) => cubit.setFavorite(false),
      expect: () => [false],
    );

    blocTest<DetailsFavoriteCubit, bool>(
      'the cubit should emit true'
      'when cubit.revertFavoriteValue is called'
      'only one time',
      build: () => detailsFavoriteCubit,
      act: (cubit) => cubit.revertFavoriteBoolean(),
      expect: () => [true],
    );

    blocTest<DetailsFavoriteCubit, bool>(
      'the cubit should emit [true, false]'
      'when cubit.revertFavoriteValue is called'
      'two times',
      build: () => detailsFavoriteCubit,
      act: (cubit) {
        for (int i = 0; i < 2; i++) {
          cubit.revertFavoriteBoolean();
        }
      },
      expect: () => [true, false],
    );

    blocTest<DetailsFavoriteCubit, bool>(
      'the cubit should emit [true, false, true]'
      'when cubit.revertFavoriteValue is called'
      'three times',
      build: () => detailsFavoriteCubit,
      act: (cubit) {
        for (int i = 0; i < 3; i++) {
          cubit.revertFavoriteBoolean();
        }
      },
      expect: () => [true, false, true],
    );

    blocTest<DetailsFavoriteCubit, bool>(
      'the cubit should emit [true, false, true, false]'
      'when cubit.revertFavoriteValue is called'
      'four times',
      build: () => detailsFavoriteCubit,
      act: (cubit) {
        for (int i = 0; i < 4; i++) {
          cubit.revertFavoriteBoolean();
        }
      },
      expect: () => [true, false, true, false],
    );
  });
}
