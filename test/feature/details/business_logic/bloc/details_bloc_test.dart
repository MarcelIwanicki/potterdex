import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/details/business_logic/bloc/details_bloc.dart';

import '../../../dashboard/repository/service/mock_harry_potter_characters_service.dart';

class MockDetailsBloc extends MockBloc<DetailsEvent, DetailsState>
    implements DetailsBloc {}

void main() {
  group('DetailsBloc', () {
    late DetailsBloc detailsBloc;
    late DetailsBloc mockDetailsBloc;

    setUpAll(() {
      registerFallbackValue(GetHarryPotterCharacterDetailsEvent());
      registerFallbackValue(DetailsInitialState());
      registerFallbackValue(
          HarryPotterCharacterIsLoadedState(HarryPotterCharacter.empty()));
    });

    setUp(() {
      detailsBloc = DetailsBloc(MockHarryPotterCharactersService());
      mockDetailsBloc = MockDetailsBloc();
    });

    tearDown(() {
      detailsBloc.close();
      mockDetailsBloc.close();
    });

    test('the initial state for DetailsBloc is DetailsInitialState', () {
      expect(detailsBloc.state, isA<DetailsInitialState>());
    });

    blocTest<DetailsBloc, DetailsState>(
        'the bloc should emit '
        '[HarryPotterCharacterIsLoadingState:HarryPotterCharacterIsLoadingState(),'
        'HarryPotterCharacterIsNotLoadedState:HarryPotterCharacterIsNotLoadedState()]'
        'when GetHarryPotterCharacterDetailsEvent() is called',
        build: () => detailsBloc,
        act: (bloc) => bloc.add(GetHarryPotterCharacterDetailsEvent()),
        expect: () => [
              HarryPotterCharacterIsLoadingState(),
              HarryPotterCharacterIsNotLoadedState()
            ]);

    test(
        'bloc should emit HarryPotterCharacterIsLoadedState on the end'
        'of the stream [initial, loading, loaded]'
        'and object is loaded', () async {
      whenListen(
          mockDetailsBloc,
          Stream.fromIterable([
            HarryPotterCharacterIsLoadingState(),
            HarryPotterCharacterIsLoadedState(HarryPotterCharacter.empty())
          ]),
          initialState: DetailsInitialState());

      expect(mockDetailsBloc.state, isA<DetailsInitialState>());
      await expectLater(
          mockDetailsBloc.stream,
          emitsInOrder(<DetailsState>[
            HarryPotterCharacterIsLoadingState(),
            HarryPotterCharacterIsLoadedState(HarryPotterCharacter.empty())
          ]));
      expect(mockDetailsBloc.state,
          HarryPotterCharacterIsLoadedState(HarryPotterCharacter.empty()));
    });

    test(
        'bloc should emit HarryPotterCharacterIsNotLoadedState on the end'
        'of the stream [initial, loading, notloaded]'
        'and object is not loaded', () async {
      whenListen(
          mockDetailsBloc,
          Stream.fromIterable([
            HarryPotterCharacterIsLoadingState(),
            HarryPotterCharacterIsNotLoadedState()
          ]),
          initialState: DetailsInitialState());

      expect(mockDetailsBloc.state, isA<DetailsInitialState>());
      await expectLater(
          mockDetailsBloc.stream,
          emitsInOrder(<DetailsState>[
            HarryPotterCharacterIsLoadingState(),
            HarryPotterCharacterIsNotLoadedState()
          ]));
      expect(mockDetailsBloc.state, HarryPotterCharacterIsNotLoadedState());
    });
  });
}
