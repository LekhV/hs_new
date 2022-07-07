import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/cards_collections_bloc.dart';
import 'bloc/cards_collections_event.dart';
import 'bloc/cards_collections_state.dart';
import 'collection_details_screen/all_cards_collection_screen/all_cards_collection_screen.dart';
import 'collection_details_screen/collection_details_screen.dart';
import 'collection_content_enum.dart';

import 'collection_details_screen/collection_screen/collection_screen.dart';
import 'collection_details_screen/old_collections_screen.dart/old_collections.dart';
import 'widgets/custom_dialog_widget.dart';
import 'widgets/inform_message.dart';

class MainCollectionsScreen extends StatefulWidget {
  const MainCollectionsScreen({
    required this.classes,
    Key? key,
  }) : super(key: key);

  final List<String> classes;

  @override
  _MainCollectionsScreenState createState() => _MainCollectionsScreenState();
}

class _MainCollectionsScreenState extends State<MainCollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<CardsCollectionsBloc, CardsCollectionsState>(
                listener: (context, state) {
                  if (state.iShowDialog) {
                    _showDialog();
                  }
                  if (state.isShowRule) {
                    _showMessage(context, error: state.error);
                  }
                },
                builder: (context, state) {
                  if (state.collectionsState == CollectionsStateEnum.init) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).backgroundColor,
                        ),
                      ),
                    );
                  }
                  if (state.collectionsState == CollectionsStateEnum.error) {
                    return CustomErrorWidget(textError: localizations.failedFetchCards);
                  }
                  if (state.collectionsState == CollectionsStateEnum.success ||
                      state.collectionsState == CollectionsStateEnum.loadAdd ||
                      state.collectionsState == CollectionsStateEnum.loadDelete) {
                    switch (state.content) {
                      case CollectionsContentEnum.initialScreen:
                        return CollectionDetailsScreen(classes: widget.classes);

                      case CollectionsContentEnum.newCollection:
                        return AllCardCollectionScreen(state: state, classes: widget.classes);

                      case CollectionsContentEnum.oldCollections:
                        return OldCollections(state: state, classes: widget.classes);

                      case CollectionsContentEnum.collection:
                        return CollectionScreen(state: state);

                      case CollectionsContentEnum.oldCollection:
                        return CollectionScreen(state: state, isOldCollection: true);

                      case CollectionsContentEnum.allCards:
                        return AllCardCollectionScreen(state: state, isShowButton: false);

                      default:
                        return Container();
                    }
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

  void _showDialog() {
    Future.delayed(const Duration(milliseconds: 300), () {
      showDialog<String>(
        context: context,
        builder: (_) => CustomDialogWidget(
          onTapOk: (String value) {
            if (value.isNotEmpty) {
              BlocProvider.of<CardsCollectionsBloc>(context)
                  .add(CreateCollection(nameCollection: value));
            } else {
              _showMessage(context, text: 'Collections did not create.');
            }
          },
        ),
      );
    });
  }

  void _showMessage(BuildContext context, {Object? error, String? text}) {
    final errorText = context.localizations!.getErrorMessage(error ?? text ?? '');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: InformMessageWidget(text: errorText),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
