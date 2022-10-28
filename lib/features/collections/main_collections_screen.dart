import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/features/collections/widgets/collection_error_widget.dart';

import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/cards_collections_bloc.dart';
import 'bloc/cards_collections_event.dart';
import 'bloc/cards_collections_state.dart';

import 'collection_content_enum.dart';

import 'collections_details/all_cards_collection/all_cards_collection_screen.dart';
import 'collections_details/collection_screen/collection_screen.dart';
import 'collections_details/collections_details_screen.dart';
import 'collections_details/old_collections_screen.dart/old_collections_screen.dart';
import 'widgets/collection_app_bar.dart';
import 'widgets/custom_dialog_widget.dart';
import 'widgets/inform_message.dart';

class MainCollectionsScreen extends StatefulWidget {
  static const _routeName = '/cards_collections';

  static MaterialPageRoute getRoute(List<String> classes) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => BlocProvider<CardsCollectionsBloc>(
        create: (BuildContext context) => CardsCollectionsBloc()
          ..add(const ChangeContent(
            typeContent: CollectionsContentEnum.initialScreen,
          )),
        child: MainCollectionsScreen(classes: classes),
      ),
    );
  }

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
                    return Column(
                      children: [
                        CollectionAppBar(
                          title: localizations.cardsCollections,
                          contentEnum: CollectionsContentEnum.initialScreen,
                        ),
                        CollectionErrorWidget(textError: localizations.failedFetchCards),
                      ],
                    );
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
                        return OldCollectionsScreen(state: state, classes: widget.classes);

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
              final bloc = BlocProvider.of<CardsCollectionsBloc>(context);

              bloc.add(CreateCollection(nameCollection: value, card: bloc.state.card));
            } else {
              _showMessage(context, text: context.localizations!.collectionsDidNotCreate);
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
