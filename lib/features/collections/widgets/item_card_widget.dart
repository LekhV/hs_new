import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/features/cards_screen/widgets/item_list_widget.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import 'circle_button_widget.dart';

class ItemCardWidget extends StatelessWidget {
  final CardByParams card;
  final String cardId;
  final String nameCollection;
  final bool isLoadAdd;
  final bool isLoadDelete;

  const ItemCardWidget({
    Key? key,
    required this.card,
    this.nameCollection = '',
    this.cardId = '',
    this.isLoadAdd = false,
    this.isLoadDelete = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return card.img != null
        ? Stack(
            children: [
              ItemListCardsWidget(
                cardByParams: card,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    CircleButtonWidget(
                      title: localizations.add,
                      text: '+',
                      isLoad: isLoadAdd,
                      onTap: () {
                        //TODO: add card
                        BlocProvider.of<CardsCollectionsBloc>(context).add(
                          AddCard(card: card, nameCollection: nameCollection),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    CircleButtonWidget(
                      title: localizations.delete,
                      text: '-',
                      isLoad: isLoadDelete,
                      onTap: () {
                        //TODO: delete card
                        BlocProvider.of<CardsCollectionsBloc>(context).add(
                          DeleteCard(
                            nameCollection: nameCollection,
                            cardId: cardId.isEmpty ? card.cardId! : cardId,
                            card: card,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
