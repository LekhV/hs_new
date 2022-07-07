import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/features/collections/widgets/item_card_widget.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import '../bloc/cards_collections_bloc.dart';
import '../bloc/cards_collections_event.dart';
import '../bloc/cards_collections_state.dart';
import 'collections_screen.dart';
import '../widgets/custom_dialog_widget.dart';
import '../widgets/inform_message.dart';

class NewCollectionsScreen extends StatefulWidget {
  const NewCollectionsScreen({
    required this.parameter,
    required this.classes,
    Key? key,
  }) : super(key: key);

  final String parameter;
  final List<String> classes;

  @override
  _NewCollectionsScreenState createState() => _NewCollectionsScreenState();
}

class _NewCollectionsScreenState extends State<NewCollectionsScreen> {
  String title = '';

  @override
  void initState() {
    super.initState();
    title = widget.parameter;

    BlocProvider.of<CardsCollectionsBloc>(context).add(
      CardsFetched(
        parameter: widget.parameter,
        isShowDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          children: [
            AppBar(
              title: Text(localizations.listOf(title)),
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
                    setState(() {
                      title = item;
                    });
                    BlocProvider.of<CardsCollectionsBloc>(context).add(
                      CardsFetched(
                        parameter: item,
                        isShowDialog: true,
                      ),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<CardsCollectionsBloc, CardsCollectionsState>(
                listener: (context, state) {
                  if (state.iShowDialog) {
                    _showDialog();
                  }
                  if (state.isShowRule) {
                    _showMessage(context, state.error.toString());
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
                  if (state.collectionsState == CollectionsStateEnum.success) {
                    if (state.listCards!.isEmpty) {
                      return CustomErrorWidget(textError: localizations.noData);
                    }
                    return _contentBuild(state);
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
              _showMessage(context, 'Collections did not create.');
            }
          },
        ),
      );
    });
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

  Widget _contentBuild(CardsCollectionsState state) {
    final localizations = context.localizations!;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.listCards!.length,
            itemBuilder: (_, i) => ItemCardWidget(
              nameCollection: state.nameCollection,
              card: state.listCards![i],
            ),
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
              if (state.nameCollection.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider<CardsCollectionsBloc>.value(
                      value: BlocProvider.of<CardsCollectionsBloc>(context),
                      child: CollectionsScreen(
                        nameCollection: state.nameCollection,
                      ),
                    ),
                  ),
                );
              } else {
                _showMessage(context, 'Collections did not create.');
              }
            },
          ),
        ),
      ],
    );
  }
}
