import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/card_details_image.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';
import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_html/flutter_html.dart';

import 'bloc/card_details_bloc.dart';
import 'bloc/card_details_event.dart';
import 'bloc/card_details_state.dart';

class CardDetailsScreen extends StatefulWidget {
  static const _routeName = '/card_details';

  static MaterialPageRoute getRoute(String cardId) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => BlocProvider<CardDetailsBloc>(
          create: (BuildContext context) => CardDetailsBloc(),
          child: CardDetailsScreen(cardId: cardId)),
    );
  }

  const CardDetailsScreen({required this.cardId, Key? key}) : super(key: key);
  final String cardId;

  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardDetailsBloc>(context).add(CardDetailsFetched(cardId: widget.cardId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardDetailsBloc, CardDetailsState>(
      builder: (context, state) {
        if (state is CardDetailsInitial) {
          return const CustomIndicator();
        }
        if (state is CardDetailsFailure) {
          return const CustomErrorWidget(textError: 'No data');
        }
        if (state is CardDetailsSuccess) {
          return Scaffold(
            body: BackgroundContainer(
              child: ListView(
                children: [
                  AppBar(
                    title: Text(
                      state.cardDetails!.name!,
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  CardDetailsImage(state.cardDetails!.img),
                  Html(
                    data: state.cardDetails!.text ?? '',
                    style: {
                      "html": Style(
                        fontSize: const FontSize(18.0),
                        color: Colors.white,
                      ),
                    },
                  ),
                  _text('', state.cardDetails!.flavor),
                  _text('Type: ', state.cardDetails!.type),
                  _text('Class: ', state.cardDetails!.playerClass),
                  _text('Set: ', state.cardDetails!.cardSet),
                  if (state.cardDetails!.imgGold != null) ...{
                    CardDetailsImage(state.cardDetails!.imgGold),
                  },
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

Widget _text(String title, String? text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}
