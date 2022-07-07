import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../collection_content_enum.dart';

class CollectionAppBar extends StatelessWidget {
  final String title;
  final CollectionsContentEnum contentEnum;
  final ValueChanged<String>? onPressActions;
  final List<String>? classes;
  final VoidCallback? onTapLeading;

  const CollectionAppBar({
    Key? key,
    required this.title,
    required this.contentEnum,
    this.onPressActions,
    this.classes = const [],
    this.onTapLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return AppBar(
      title: Text(localizations.listOf(title)),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            BlocProvider.of<CardsCollectionsBloc>(context).add(
              ChangeContent(typeContent: contentEnum),
            );

            if (onTapLeading != null) {
              onTapLeading!();
            }
          },
          icon: const Icon(Icons.arrow_back_ios)),
      actions: [
        if (classes!.isNotEmpty)
          PopupMenuButton<String>(
            itemBuilder: (context) =>
                classes!.map((item) => PopupMenuItem(value: item, child: Text(item))).toList(),
            onSelected: onPressActions,
          ),
      ],
    );
  }
}
