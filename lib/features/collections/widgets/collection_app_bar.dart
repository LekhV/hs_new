import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../collection_content_enum.dart';
import 'multi_select_widget.dart';

class CollectionAppBar extends StatefulWidget {
  final String title;
  final CollectionsContentEnum contentEnum;
  final ValueChanged<String>? onPressActions;
  final List<String>? classes;
  final VoidCallback? onTapLeading;
  final bool isShowFilter;
  final bool isCollectionCards;

  const CollectionAppBar({
    Key? key,
    required this.title,
    required this.contentEnum,
    this.onPressActions,
    this.classes = const [],
    this.onTapLeading,
    this.isShowFilter = false,
    this.isCollectionCards = false,
  }) : super(key: key);

  @override
  State<CollectionAppBar> createState() => _CollectionAppBarState();
}

class _CollectionAppBarState extends State<CollectionAppBar> {
  List<int> _selectedItems = [];
  @override
  void initState() {
    super.initState();
    _selectedItems = BlocProvider.of<CardsCollectionsBloc>(context).state.selectedCoins ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return AppBar(
      title: Text(localizations.listOf(widget.title)),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            BlocProvider.of<CardsCollectionsBloc>(context).add(
              ChangeContent(typeContent: widget.contentEnum),
            );

            if (widget.onTapLeading != null) {
              widget.onTapLeading!();
            }
          },
          icon: const Icon(Icons.arrow_back_ios)),
      actions: [
        if (widget.classes!.isNotEmpty)
          PopupMenuButton<String>(
            itemBuilder: (context) => widget.classes!
                .map((item) => PopupMenuItem(value: item, child: Text(item)))
                .toList(),
            onSelected: widget.onPressActions,
          ),
        if (widget.isShowFilter)
          IconButton(
            onPressed: _showMultiSelect,
            icon: const Icon(Icons.filter_list),
          ),
      ],
    );
  }

  void _showMultiSelect() async {
    final List<int>? results = await showDialog(
      context: context,
      builder: (BuildContext _) {
        return BlocProvider.value(
          value: BlocProvider.of<CardsCollectionsBloc>(context),
          child: MultiSelectWidget(
            selectedItems: _selectedItems,
            isCollectionCards: widget.isCollectionCards,
          ),
        );
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }
}
