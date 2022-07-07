import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';

import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../bloc/cards_collections_state.dart';
import 'all_cards.dart';
import '../widgets/inform_message.dart';
import '../widgets/item_card_widget.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({
    required this.nameCollection,
    this.isOldCollection = false,
    Key? key,
  }) : super(key: key);

  final String nameCollection;
  final bool isOldCollection;

  @override
  _CollectionsScreenState createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardsCollectionsBloc>(context).add(
      GetCardsCollection(nameCollection: widget.nameCollection),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<CardsCollectionsBloc, CardsCollectionsState>(
      listener: (context, state) {
        if (state.isShowRule) {
          _showMessage(context, state.error);
        }

        if (state.isDeletedCollection) {
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.pop(context);
          });
        }
      },
      builder: (context, state) {
        if (state.collectionsState == CollectionsStateEnum.init) {
          return const CustomIndicator();
        }
        if (state.collectionsState == CollectionsStateEnum.error) {
          return CustomErrorWidget(textError: localizations.failedFetchCards);
        }
        if (state.collectionsState == CollectionsStateEnum.success) {
          if (state.cardsCollection == null || state.cardsCollection!.isEmpty) {
            return CustomErrorWidget(textError: localizations.noData);
          }
          return Scaffold(
            body: BackgroundContainer(
              child: Column(
                children: [
                  AppBar(
                    title: Text(widget.nameCollection),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cardsCollection!.length,
                      itemBuilder: (_, i) => ItemCardWidget(
                        card: state.cardsCollection![i].cardByParams,
                        nameCollection: widget.nameCollection,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.isOldCollection
                          ? SizedBox(
                              height: 54,
                              width: widget.isOldCollection ? (width - 30) / 2 : double.infinity,
                              child: OutlinedButton(
                                child: const Text(
                                  'Add another cards',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider<CardsCollectionsBloc>.value(
                                        value: BlocProvider.of<CardsCollectionsBloc>(context),
                                        child: AllCards(
                                          parameter: state.parameter,
                                          nameCollection: widget.nameCollection,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 54,
                        width: widget.isOldCollection ? (width - 30) / 2 : width - 20,
                        child: OutlinedButton(
                          child: const Text(
                            'Delete Collection',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<CardsCollectionsBloc>(context).add(
                              DeleteCardsCollection(
                                nameCollection: widget.nameCollection,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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

  void _showMessage(BuildContext context, Object? error) {
    final text = error == const CardsLimitExceededException()
        ? 'Limit of cards of one type 2'
        : 'Card collection limit 10';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: InformMessageWidget(text: text),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
