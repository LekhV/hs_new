import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/features/collections/collection_content_enum.dart';

import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../../bloc/cards_collections_bloc.dart';
import '../../bloc/cards_collections_event.dart';
import '../../bloc/cards_collections_state.dart';
import '../../collection_content_enum.dart';
import '../../widgets/collection_app_bar.dart';
import '../../widgets/collection_error_widget.dart';
import '../../widgets/inform_message.dart';
import '../../widgets/item_card_widget.dart';

class AllCardCollectionScreen extends StatefulWidget {
  const AllCardCollectionScreen({
    required this.state,
    this.isShowButton = true,
    this.nameCollection,
    this.classes = const [],
    Key? key,
  }) : super(key: key);

  final CardsCollectionsState state;
  final bool isShowButton;
  final String? nameCollection;
  final List<String> classes;

  @override
  State<AllCardCollectionScreen> createState() => _AllCardCollectionScreenState();
}

class _AllCardCollectionScreenState extends State<AllCardCollectionScreen> {
  String title = '';
  CardsCollectionsBloc get bloc => BlocProvider.of<CardsCollectionsBloc>(context);

  @override
  void initState() {
    super.initState();
    title = widget.classes.isNotEmpty
        ? widget.classes.first
        : widget.nameCollection ?? widget.state.parameter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionAppBar(
          title: title,
          contentEnum: widget.isShowButton
              ? CollectionsContentEnum.initialScreen
              : CollectionsContentEnum.oldCollection,
          classes: widget.classes,
          onPressActions: (item) {
            bloc.add(CardsFetched(parameter: item, isShowDialog: widget.isShowButton));
            setState(() {
              title = item;
            });
          },
        ),
        if (widget.state.listCards!.isEmpty) ...{
          const CollectionErrorWidget(),
        } else ...{
          _contentBuild(),
        }
      ],
    );
  }

  Widget _contentBuild() {
    final localizations = context.localizations!;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.state.listCards!.length,
              itemBuilder: (_, i) {
                bool isLoadAdd = false;
                bool isLoadDelete = false;

                if (widget.state.collectionsState == CollectionsStateEnum.loadAdd &&
                    widget.state.nameCollection.isNotEmpty) {
                  isLoadAdd = widget.state.card == widget.state.listCards![i];
                }

                if (widget.state.collectionsState == CollectionsStateEnum.loadDelete) {
                  isLoadDelete = widget.state.card == widget.state.listCards![i];
                }

                return ItemCardWidget(
                  nameCollection: widget.nameCollection ?? widget.state.nameCollection,
                  card: widget.state.listCards![i],
                  isLoadAdd: isLoadAdd,
                  isLoadDelete: isLoadDelete,
                );
              },
            ),
          ),
          if (widget.isShowButton)
            SizedBox(
              height: 54,
              width: double.infinity,
              child: OutlinedButton(
                child: Text(
                  localizations.checkCardsCollection,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  if (widget.state.nameCollection.isNotEmpty) {
                    //TODO:  get collection
                    bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.collection));
                    // bloc.add(GetCardsCollection(nameCollection: widget.state.nameCollection));
                  } else {
                    _showMessage(context, localizations.collectionsDidNotCreate);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: InformMessageWidget(text: text),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
