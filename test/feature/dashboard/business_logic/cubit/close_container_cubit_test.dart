import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';

void main() {
  group('CloseContainerCubit', () {
    late CloseContainerCubit closeContainerCubit;

    setUp(() {
      closeContainerCubit = CloseContainerCubit();
    });

    tearDown(() {
      closeContainerCubit.close();
    });

    test(
        'the initial state for the CloseContainerCubit is that cubit state is false)',
        () {
      expect(closeContainerCubit.state, false);
    });

    blocTest<CloseContainerCubit, bool>(
      'the cubit should emit false'
      'when cubit.handleClosingContainer(scroll) is called'
      'and scroll < SCROLL_CLOSE_VALUE',
      build: () => closeContainerCubit,
      act: (cubit) => cubit.handleClosingContainer(SCROLL_CLOSE_VALUE - 1),
      expect: () => [false],
    );

    blocTest<CloseContainerCubit, bool>(
      'the cubit should emit false'
      'when cubit.handleClosingContainer(scroll) is called'
      'and scroll == SCROLL_CLOSE_VALUE',
      build: () => closeContainerCubit,
      act: (cubit) => cubit.handleClosingContainer(SCROLL_CLOSE_VALUE),
      expect: () => [false],
    );

    blocTest<CloseContainerCubit, bool>(
      'the cubit should emit true'
      'when cubit.handleClosingContainer(scroll) is called'
      'and scroll > SCROLL_CLOSE_VALUE',
      build: () => closeContainerCubit,
      act: (cubit) => cubit.handleClosingContainer(SCROLL_CLOSE_VALUE + 1),
      expect: () => [true],
    );
  });
}
