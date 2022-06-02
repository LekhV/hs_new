import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/features/cards_screen/bloc/list_cards_bloc.dart';
import 'package:flutter_hs/features/cards_screen/bloc/list_cards_event.dart';
import 'package:flutter_hs/features/cards_screen/bloc/list_cards_state.dart';
import 'package:flutter_hs/features/cards_screen/widgets/item_list_widget.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';
import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

class SearchCardsScreen extends StatefulWidget {
  static const _routeName = '/search_cards';

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => BlocProvider<CardsBloc>(
        create: (BuildContext context) => CardsBloc(),
        child: const SearchCardsScreen(),
      ),
    );
  }

  const SearchCardsScreen({Key? key}) : super(key: key);

  @override
  _SearchCardsScreenState createState() => _SearchCardsScreenState();
}

class _SearchCardsScreenState extends State<SearchCardsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          children: [
            AppBar(
              title: Text(localizations.searchCards),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            _searchWidget(),
            Expanded(
              child: BlocBuilder<CardsBloc, CardsState>(
                builder: (context, state) {
                  if (state is CardsInitial) {
                    return CustomErrorWidget(textError: localizations.pleaseStartEnterName);
                  }
                  if (state is CardsLoading) {
                    return const CustomIndicator();
                  }
                  if (state is CardsFailure) {
                    return CustomErrorWidget(textError: localizations.cardNotFound);
                  }
                  if (state is CardsSuccess) {
                    if (state.listCards == null) {
                      return CustomErrorWidget(textError: localizations.noData);
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listCards!.length,
                      itemBuilder: (_, i) => state.listCards![i].img != null
                          ? ItemListCardsWidget(
                              cardByParams: state.listCards![i],
                            )
                          : Container(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchWidget() {
    final localizations = context.localizations!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
      ),
      child: TextField(
        onChanged: (value) {
          BlocProvider.of<CardsBloc>(context).add(
            SearchCards(parameter: 'search/$value'),
          );
        },
        cursorColor: Theme.of(context).colorScheme.background,
        decoration: InputDecoration(
          hintText: localizations.enterNameOfTheCard,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
          prefixIcon: const Icon(Icons.search),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
    );
  }
}
