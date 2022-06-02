import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';
import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/cardbacks_bloc.dart';
import 'bloc/cardbacks_event.dart';
import 'bloc/cardbacks_state.dart';
import 'card_back_details_screen/card_back_details_screen.dart';

class CardBacksScreen extends StatefulWidget {
  static const _routeName = '/list_cards_backs';

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => BlocProvider(
        create: (BuildContext context) => CardBacksBloc(),
        child: const CardBacksScreen(),
      ),
    );
  }

  const CardBacksScreen({Key? key}) : super(key: key);

  @override
  _CardBacksScreenState createState() => _CardBacksScreenState();
}

class _CardBacksScreenState extends State<CardBacksScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardBacksBloc>(context).add(CardBacksFetched());
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return BlocBuilder<CardBacksBloc, CardBacksState>(
      builder: (context, state) {
        if (state is CardBacksInitial) {
          return const CustomIndicator();
        }
        if (state is CardBacksFailure) {
          return CustomErrorWidget(textError: localizations.failedFetchCardBacks);
        }
        if (state is CardBacksSuccess) {
          if (state.listCardBacks == null) {
            return CustomErrorWidget(textError: localizations.noCardBacks);
          }
          return Scaffold(
            body: BackgroundContainer(
              child: Column(
                children: [
                  AppBar(
                    title: Text(localizations.listCards),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.listCardBacks!.length,
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          CardBackDetailsScreen.getRoute(state.listCardBacks![i]),
                        ),
                        child: state.listCardBacks![i].img != null
                            ? Image.network(
                                state.listCardBacks![i].img!,
                              )
                            : Center(
                                child: Text(
                                  state.listCardBacks![i].name!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200 / 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
