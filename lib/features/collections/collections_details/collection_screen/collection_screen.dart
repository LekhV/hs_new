import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/theme/app_colors.dart';
import '../../bloc/cards_collections_bloc.dart';
import '../../bloc/cards_collections_event.dart';
import '../../bloc/cards_collections_state.dart';
import '../../collection_content_enum.dart';
import '../../widgets/collection_app_bar.dart';
import '../../widgets/collection_error_widget.dart';
import '../../widgets/item_card_widget.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({
    required this.state,
    this.isOldCollection = false,
    Key? key,
  }) : super(key: key);

  final CardsCollectionsState state;

  final bool isOldCollection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionAppBar(
          title: state.nameCollection,
          contentEnum: isOldCollection
              ? CollectionsContentEnum.oldCollections
              : CollectionsContentEnum.newCollection,
          onTapLeading: () => isOldCollection
              ? BlocProvider.of<CardsCollectionsBloc>(context).add(GetCollections(state.parameter))
              : null,
        ),
        if (state.cardsCollection == null || state.cardsCollection!.isEmpty)
          const CollectionErrorWidget(),
        if (state.cardsCollection != null && state.cardsCollection!.isNotEmpty)
          _contentBuild(context),
      ],
    );
  }

  Widget _contentBuild(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.cardsCollection!.length,
              itemBuilder: (_, i) {
                bool isLoadAdd = false;
                bool isLoadDelete = false;
                final card = state.cardsCollection![i].card;
                if (state.collectionsState == CollectionsStateEnum.loadAdd) {
                  isLoadAdd = state.card == card;
                }

                if (state.collectionsState == CollectionsStateEnum.loadDelete) {
                  isLoadDelete = state.card == card;
                }

                return ItemCardWidget(
                  nameCollection: state.nameCollection,
                  card: card,
                  isLoadAdd: isLoadAdd,
                  isLoadDelete: isLoadDelete,
                );
              },
            ),
          ),
          bottomConntent(context),
        ],
      ),
    );
  }

  Widget bottomConntent(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bloc = BlocProvider.of<CardsCollectionsBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isOldCollection
            ? SizedBox(
                height: 54,
                width: isOldCollection ? (width - 30) / 2 : double.infinity,
                child: OutlinedButton(
                  child: const Text(
                    'Add another cards',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    //TODO:change content and card fetched
                    bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.allCards));
                    bloc.add(CardsFetched(parameter: state.parameter));
                  },
                ),
              )
            : Container(),
        SizedBox(
          height: 54,
          width: isOldCollection ? (width - 30) / 2 : width - 20,
          child: OutlinedButton(
            child: const Text(
              'Delete Collection',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
            onPressed: () {
              bloc.add(DeleteCardsCollection(nameCollection: state.nameCollection));
              bloc.add(ChangeContent(
                typeContent: isOldCollection
                    ? CollectionsContentEnum.oldCollections
                    : CollectionsContentEnum.newCollection,
              ));
              if (isOldCollection) {
                //TODO: get collections
                bloc.add(GetCollections(state.parameter));
              }
            },
          ),
        ),
      ],
    );
  }
}
