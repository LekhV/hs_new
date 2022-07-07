import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/features/collections/collection_content_enum.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

import 'package:flutter_hs/ui_kit/background_container.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';

class CollectionDetailsScreen extends StatefulWidget {
  static const _routeName = '/cards_collections';

  static MaterialPageRoute getRoute(List<String> classes) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => CollectionDetailsScreen(classes: classes),
    );
  }

  const CollectionDetailsScreen({
    required this.classes,
    Key? key,
  }) : super(key: key);

  final List<String> classes;

  @override
  _CollectionDetailsScreenState createState() => _CollectionDetailsScreenState();
}

class _CollectionDetailsScreenState extends State<CollectionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          children: [
            AppBar(
              title: Text(localizations.cardsCollections),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            const SizedBox(height: 27),
            _customButton(
              title: localizations.createCardsCollection,
              onTap: () {
                final bloc = BlocProvider.of<CardsCollectionsBloc>(context);
                bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.newCollection));
                bloc.add(CardsFetched(parameter: widget.classes.first, isShowDialog: true));
              },
            ),
            const SizedBox(height: 27),
            _customButton(
              title: localizations.showCardsCollections,
              onTap: () {
                final bloc = BlocProvider.of<CardsCollectionsBloc>(context);
                bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.oldCollections));
                bloc.add(GetCollections(widget.classes.first));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton({required String title, required VoidCallback onTap}) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: OutlinedButton(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
