import 'package:bloc/bloc.dart';

const SCROLL_CLOSE_VALUE = 50;

class CloseContainerCubit extends Cubit<bool> {
  CloseContainerCubit() : super(false);

  void handleClosingContainer(scroll) => emit(scroll > SCROLL_CLOSE_VALUE);
}
