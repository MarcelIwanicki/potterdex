import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_state.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/categories_scroller.dart';
import 'package:potterdex/feature/dashboard/presentation/widget/dashboard_appbar.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';

import '../widget/harry_potter_characters_list.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardBloc dashboardBloc;
  late CloseContainerCubit closeContainerCubit;

  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    dashboardBloc.add(GetHarryPotterCharactersFromInternetEvent());
    closeContainerCubit = BlocProvider.of<CloseContainerCubit>(context);
    scrollController.addListener(() {
      closeContainerCubit.updateCloseContainer(scrollController.offset);
      closeContainerCubit.handleClosingContainer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight =
        size.height * AppDimens.DASHBOARD_HEIGHT_MULTIPLIER;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DashboardAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).accentColor,
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: AppDimens.DASHBOARD_BOTTOM_BAR_NOTCH_MARGIN,
          child: Container(
            height: AppDimens.DASHBOARD_BOTTOM_BAR_HEIGHT,
          ),
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: [
              const SizedBox(
                height: AppDimens.DASHBOARD_SPACE_BETWEEN_NAVBAR_AND_CATEGORIES,
              ),
              BlocBuilder<CloseContainerCubit, CloseContainerState>(
                builder: (context, state) {
                  return AnimatedOpacity(
                    duration: const Duration(
                        milliseconds:
                            AppDimens.DURATION_ANIMATION_DEFAULT_MILLISECONDS),
                    opacity: state.isClosed ? 0 : 1,
                    child: AnimatedContainer(
                        duration: const Duration(
                            milliseconds: AppDimens
                                .DURATION_ANIMATION_DEFAULT_MILLISECONDS),
                        width: size.width,
                        alignment: Alignment.topCenter,
                        curve: Curves.fastOutSlowIn,
                        height: state.isClosed ? 0 : categoryHeight,
                        child: categoriesScroller),
                  );
                },
              ),
              BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                if (state is DashboardInitialState) {
                  return Text(AppStrings.DASHBOARD_INITIAL_STATE_STRING);
                } else if (state is HarryPotterCharactersAreLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HarryPotterCharactersAreLoadedState) {
                  return HarryPotterCharactersList(
                      state.getCharacters, scrollController);
                }
                return Text(AppStrings.DASHBOARD_UNKNOWN_ERROR);
              })
            ],
          ),
        ),
      ),
    );
  }
}
