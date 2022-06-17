import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/features/cards_screen/widgets/item_list_widget.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../bloc/cards_collections_state.dart';
import '../widgets/circle_button_widget.dart';

class NewCollectionsScreen extends StatefulWidget {
  const NewCollectionsScreen({
    required this.parameter,
    required this.title,
    required this.classes,
    Key? key,
  }) : super(key: key);

  final String parameter;
  final String title;
  final List<String> classes;

  @override
  _NewCollectionsScreenState createState() => _NewCollectionsScreenState();
}

class _NewCollectionsScreenState extends State<NewCollectionsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardsCollectionsBloc>(context).add(CardsFetched(parameter: widget.parameter));
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
                    title: Text(localizations.listOf(state.parameter ?? widget.parameter)),
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
                          ? Stack(
                              children: [
                                ItemListCardsWidget(
                                  cardByParams: state.listCards![i],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      CircleButtonWidget(
                                        title: localizations.add,
                                        text: '+',
                                        onTap: () {},
                                      ),
                                      const SizedBox(height: 15),
                                      CircleButtonWidget(
                                        title: localizations.delete,
                                        text: '-',
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ),
                  ),
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
                          //TODO: Show collection from BD
                        }),
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
