import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../collection_content_enum.dart';

class CollectionDetailsScreen extends StatefulWidget {
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

    return Column(
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
            //TODO: change content and get cards
            final bloc = BlocProvider.of<CardsCollectionsBloc>(context);
            bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.newCollection));
            bloc.add(CardsFetched(parameter: widget.classes.first, isShowDialog: true));
          },
        ),
        const SizedBox(height: 27),
        _customButton(
          title: localizations.showCardsCollections,
          onTap: () {
            //TODO: change content and get collections
            final bloc = BlocProvider.of<CardsCollectionsBloc>(context);
            bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.oldCollections));
            // bloc.add(GetCollections(widget.classes.first));
          },
        ),
      ],
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
