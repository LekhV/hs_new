import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/list_cards_bloc.dart';
import 'bloc/list_cards_event.dart';
import 'bloc/list_cards_state.dart';
import 'widgets/item_list_widget.dart';

class CardsScreen extends StatefulWidget {
  static const _routeName = '/list_cards';

  static MaterialPageRoute getRoute(String parameter, String title) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => BlocProvider<CardsBloc>(
          create: (BuildContext context) => CardsBloc(),
          child: CardsScreen(parameter: parameter, title: title)),
    );
  }

  const CardsScreen({
    required this.parameter,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String parameter;
  final String title;

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardsBloc>(context).add(CardsFetched(parameter: widget.parameter));
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return BlocBuilder<CardsBloc, CardsState>(
      builder: (context, state) {
        if (state is CardsInitial) {
          return const CustomIndicator();
        }
        if (state is CardsFailure) {
          return CustomErrorWidget(textError: localizations.failedFetchCards);
        }
        if (state is CardsSuccess) {
          if (state.listCards!.isEmpty) {
            return CustomErrorWidget(textError: localizations.noData);
          }
          return Scaffold(
            body: BackgroundContainer(
              child: Column(
                children: [
                  AppBar(
                    title: Text(localizations.listOf(widget.title)),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listCards!.length,
                      itemBuilder: (_, i) => state.listCards![i].img != null
                          ? ItemListCardsWidget(
                              cardByParams: state.listCards![i],
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
