import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/features/cards_screen/widgets/item_list_widget.dart';
import 'package:flutter_hs/features/collections/bloc/cards_collections_bloc.dart';
import 'package:flutter_hs/features/collections/bloc/cards_collections_event.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import 'circle_button_widget.dart';

class ItemCardWidget extends StatelessWidget {
  final CardByParams card;

  final String nameCollection;
  final bool isLoadAdd;
  final bool isLoadDelete;
  final ValueChanged<bool>? onTapAdd;
  final ValueChanged<bool>? onTapDelete;

  const ItemCardWidget({
    Key? key,
    required this.card,
    this.nameCollection = '',
    this.isLoadAdd = false,
    this.isLoadDelete = false,
    this.onTapAdd,
    this.onTapDelete,
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
                        if (onTapAdd != null) {
                          onTapAdd!(true);
                        }
                        BlocProvider.of<CardsCollectionsBloc>(context).add(
                          AddCard(nameCollection: nameCollection, card: card),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    CircleButtonWidget(
                      title: localizations.delete,
                      text: '-',
                      isLoad: isLoadDelete,
                      onTap: () {
                        if (onTapDelete != null) {
                          onTapDelete!(true);
                        }
                        BlocProvider.of<CardsCollectionsBloc>(context).add(
                          DeleteCard(nameCollection: nameCollection, card: card),
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
