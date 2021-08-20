import 'package:bloc/bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_state.dart';

class CloseContainerCubit extends Cubit<CloseContainerState> {
  CloseContainerCubit()
      : super(CloseContainerState(
            isClosed: false,
            scrollValue: .0,));

  void updateCloseContainer(scroll) {
    emit(CloseContainerState(
        isClosed: state.isClosed,
        scrollValue: scroll));
  }

  void handleClosingContainer() {
    bool isClosedEmitValue = state.scrollValue > 50;

    emit(CloseContainerState(
        isClosed: isClosedEmitValue,
        scrollValue: state.scrollValue));
  }
}
