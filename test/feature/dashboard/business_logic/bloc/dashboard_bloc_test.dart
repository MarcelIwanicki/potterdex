import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';

class MockDashboardBloc extends MockBloc<DashboardEvent, DashboardState>
    implements DashboardBloc {}

void main() {
  group('DashboardBloc', () {
    late DashboardBloc dashboardBloc;

    setUpAll(() {
      registerFallbackValue(GetHarryPotterCharactersEvent());
      registerFallbackValue(DashboardInitialState());
      registerFallbackValue(HarryPotterCharactersAreLoadedState(List.empty()));
    });

    setUp(() {
      dashboardBloc = MockDashboardBloc();
    });

    tearDown(() {
      dashboardBloc.close();
    });

    test('bloc should emit DashboardInitialState by default', () {
      whenListen(dashboardBloc, Stream.fromIterable([]),
          initialState: DashboardInitialState());
      expect(dashboardBloc.state, isA<DashboardInitialState>());
    });

    test(
        'bloc should emit HarryPotterCharactersAreLoadedState on the end'
        'of the stream [initial, loading, loaded]'
        'and objects are loaded', () async {
      whenListen(
          dashboardBloc,
          Stream.fromIterable([
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreLoadedState(List.empty())
          ]),
          initialState: DashboardInitialState());

      expect(dashboardBloc.state, isA<DashboardInitialState>());
      await expectLater(
          dashboardBloc.stream,
          emitsInOrder(<DashboardState>[
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreLoadedState(List.empty())
          ]));
      expect(dashboardBloc.state,
          HarryPotterCharactersAreLoadedState(List.empty()));
    });

    test(
        'bloc should emit HarryPotterCharactersAreNotLoadedState on the end'
        'of the stream [initial, loading, notLoaded]'
        'and objects are not loaded', () async {
      whenListen(
          dashboardBloc,
          Stream.fromIterable([
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreNotLoadedState()
          ]),
          initialState: DashboardInitialState());

      expect(dashboardBloc.state, isA<DashboardInitialState>());
      await expectLater(
          dashboardBloc.stream,
          emitsInOrder(<DashboardState>[
            HarryPotterCharactersAreLoadingState(),
            HarryPotterCharactersAreNotLoadedState()
          ]));
      expect(dashboardBloc.state, HarryPotterCharactersAreNotLoadedState());
    });
  });
}
