import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/features/collections/widgets/item_card_widget.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../bloc/cards_collections_state.dart';

class AllCards extends StatefulWidget {
  const AllCards({
    required this.parameter,
    this.nameCollection,
    Key? key,
  }) : super(key: key);

  final String parameter;
  final String? nameCollection;

  @override
  _AllCardsState createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardsCollectionsBloc>(context).add(CardsFetched(parameter: widget.parameter));
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return BlocBuilder<CardsCollectionsBloc, CardsCollectionsState>(
      builder: (context, state) {
        if (state.collectionsState == CollectionsStateEnum.init) {
          return const CustomIndicator();
        }
        if (state.collectionsState == CollectionsStateEnum.error) {
          return CustomErrorWidget(textError: localizations.failedFetchCards);
        }
        if (state.collectionsState == CollectionsStateEnum.success) {
          if (state.listCards!.isEmpty) {
            return CustomErrorWidget(textError: localizations.noData);
          }
          return Scaffold(
            body: BackgroundContainer(
              child: Column(
                children: [
                  AppBar(
                    title: Text(localizations.listOf(state.parameter)),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listCards!.length,
                      itemBuilder: (_, i) => ItemCardWidget(
                        nameCollection: widget.nameCollection ?? state.nameCollection,
                        card: state.listCards![i],
                      ),
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
