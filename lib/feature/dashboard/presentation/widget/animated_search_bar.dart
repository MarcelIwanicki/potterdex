import 'package:flutter/material.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/resources/values/app_dimens.dart';
import 'package:potterdex/resources/values/app_strings.dart';

class AnimatedSearchBar extends StatefulWidget {
  final DashboardBloc _dashboardBloc;
  final Size _size;

  const AnimatedSearchBar(this._dashboardBloc, this._size);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
          milliseconds: AppDimens.DURATION_ANIMATION_DEFAULT_MILLISECONDS),
      width: _folded
          ? AppDimens.DASHBOARD_SEARCH_FOLDED_WIDTH
          : widget._size.width - 100,
      height: AppDimens.DASHBOARD_SEARCH_FOLDED_WIDTH,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.DASHBOARD_SEARCH_RADIUS),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding:
                EdgeInsets.only(left: AppDimens.DASHBOARD_SEARCH_RADIUS / 2),
            child: !_folded
                ? TextField(
                    onChanged: (String query) {
                      if(query.isNotEmpty) {
                        widget._dashboardBloc
                            .add(SearchHarryPotterCharacterByQuery(query));
                      }
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: AppStrings.DASHBOARD_SEARCH,
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  )
                : null,
          )),
          AnimatedContainer(
            duration: Duration(
                milliseconds:
                    AppDimens.DURATION_ANIMATION_DEFAULT_MILLISECONDS),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        _folded ? AppDimens.DASHBOARD_SEARCH_RADIUS : 0),
                    topRight:
                        Radius.circular(AppDimens.DASHBOARD_SEARCH_RADIUS),
                    bottomLeft: Radius.circular(
                        _folded ? AppDimens.DASHBOARD_SEARCH_RADIUS : 0),
                    bottomRight:
                        Radius.circular(AppDimens.DASHBOARD_SEARCH_RADIUS)),
                child: Padding(
                  padding: const EdgeInsets.all(
                      AppDimens.DASHBOARD_SEARCH_RADIUS / 2),
                  child: Icon(_folded ? Icons.search : Icons.close,
                      color: Colors.black),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
