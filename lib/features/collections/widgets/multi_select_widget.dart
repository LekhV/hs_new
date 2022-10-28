import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/features/collections/bloc/cards_collections_bloc.dart';
import 'package:flutter_hs/features/collections/bloc/cards_collections_event.dart';
import 'package:flutter_hs/features/collections/collection_helper.dart';

import 'cost_widget.dart';

class MultiSelectWidget extends StatefulWidget {
  final List<int> selectedItems;
  final bool isCollectionCards;

  const MultiSelectWidget({
    Key? key,
    required this.selectedItems,
    required this.isCollectionCards,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelectWidget> {
  List<int> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems;
  }

  void _itemChange(int itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context, widget.selectedItems);
  }

  void _submit() {
    BlocProvider.of<CardsCollectionsBloc>(context).add(
      GetCardsByFilter(
        filter: _selectedItems,
        isCollectionCards: widget.isCollectionCards,
      ),
    );
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Costs'),
      content: SingleChildScrollView(
        child: ListBody(
          children: collectionHelper.coinList
              .map((item) => CheckboxListTile(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    value: _selectedItems.contains(item),
                    title: CostWidget(text: item.toString()),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        TextButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
