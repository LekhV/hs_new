import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/features/cards_screen/widgets/item_list_widget.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../bloc/cards_collections_state.dart';

class OldCollectionsScreen extends StatefulWidget {
  const OldCollectionsScreen({
    required this.parameter,
    required this.title,
    required this.classes,
    Key? key,
  }) : super(key: key);

  final String parameter;
  final String title;
  final List<String> classes;

  @override
  _OldCollectionsScreenState createState() => _OldCollectionsScreenState();
}

class _OldCollectionsScreenState extends State<OldCollectionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CardsCollectionsBloc>().add(CardsFetched(parameter: widget.parameter));
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return BlocBuilder<CardsCollectionsBloc, CardsCollectionsState>(
      builder: (context, state) {
        if (state.collectionsState == CollectionsStateEnum.init) {
          return const CustomIndicator();
        }
        if (state.collectionsState == CollectionsStateEnum.error) {
          return CustomErrorWidget(textError: localizations.failedFetchCards);
        }
        if (state.collectionsState == CollectionsStateEnum.success) {
          if (state.listCards!.isEmpty) {
            return CustomErrorWidget(textError: localizations.noData);
          }
          return Scaffold(
            body: BackgroundContainer(
              child: Column(
                children: [
                  AppBar(
                    title: Text(localizations.listOf(widget.title)),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    actions: [
                      PopupMenuButton<String>(
                        itemBuilder: (context) => widget.classes
                            .map(
                              (item) => PopupMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onSelected: (item) {
                          BlocProvider.of<CardsCollectionsBloc>(context)
                              .add(CardsFetched(parameter: item));
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listCards!.length,
                      itemBuilder: (_, i) => state.listCards![i].img != null
                          ? ItemListCardsWidget(
                              cardByParams: state.listCards![i],
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
