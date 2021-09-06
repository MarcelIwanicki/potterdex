import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';

import '../../repository/service/mock_harry_potter_characters_service.dart';

class MockDashboardBloc extends MockBloc<DashboardEvent, DashboardState>
    implements DashboardBloc {}

void main() {
  group('DashboardBloc', () {
    late DashboardBloc dashboardBloc;
    late DashboardBloc mockDashboardBloc;

    setUpAll(() {
      registerFallbackValue(GetHarryPotterCharactersDashboardEvent());
      registerFallbackValue(DashboardInitialState());
      registerFallbackValue(HarryPotterCharactersAreLoadedState(List.empty()));
    });

    setUp(() {
      dashboardBloc = DashboardBloc(MockHarryPotterCharactersService());
      mockDashboardBloc = MockDashboardBloc();
    });

    tearDown(() {
      dashboardBloc.close();
      mockDashboardBloc.close();
    });

    test('the initial state for DashboardBloc is DashboardInitialState', () {
      expect(dashboardBloc.state, isA<DashboardInitialState>());
    });

    blocTest<DashboardBloc, DashboardState>(
        'the bloc should emit '
            '[HarryPotterCharactersAreLoadingState:HarryPotterCharactersAreLoadingState(),'
            'HarryPotterCharactersAreNotLoadedState:HarryPotterCharactersAreNotLoadedState()]'
            'when GetHarryPotterCharacterDetailsEvent() is called',
        build: () => dashboardBloc,
        act: (bloc) => bloc.add(GetHarryPotterCharactersDashboardEvent()),
        expect: () => [
          HarryPotterCharactersAreLoadingState(),
          HarryPotterCharactersAreNotLoadedState()
        ]);

    test(
        'bloc should emit HarryPotterCharactersAreLoadedState on the end'
        'of the stream [initial, loading, loaded]'
        'and objects are loaded', () async {
      whenListen(
          mockDashboardBloc,
          Stream.fromIterable([
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreLoadedState(List.empty())
          ]),
          initialState: DashboardInitialState());

      expect(mockDashboardBloc.state, isA<DashboardInitialState>());
      await expectLater(
          mockDashboardBloc.stream,
          emitsInOrder(<DashboardState>[
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreLoadedState(List.empty())
          ]));
      expect(mockDashboardBloc.state,
          HarryPotterCharactersAreLoadedState(List.empty()));
    });

    test(
        'bloc should emit HarryPotterCharactersAreNotLoadedState on the end'
        'of the stream [initial, loading, notLoaded]'
        'and objects are not loaded', () async {
      whenListen(
          mockDashboardBloc,
          Stream.fromIterable([
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreNotLoadedState()
          ]),
          initialState: DashboardInitialState());

      expect(mockDashboardBloc.state, isA<DashboardInitialState>());
      await expectLater(
          mockDashboardBloc.stream,
          emitsInOrder(<DashboardState>[
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreNotLoadedState()
          ]));
      expect(mockDashboardBloc.state, HarryPotterCharactersAreNotLoadedState());
    });
  });
}
