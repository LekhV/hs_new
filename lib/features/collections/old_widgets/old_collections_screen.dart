import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'collections_screen.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
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
  String title = '';

  @override
  void initState() {
    title = widget.title;
    super.initState();
    context.read<CardsCollectionsBloc>().add(GetCollections(widget.parameter));
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
                    context.read<CardsCollectionsBloc>().add(GetCollections(item));
                  },
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<CardsCollectionsBloc, CardsCollectionsState>(
                builder: (context, state) {
                  if (state.collectionsState == CollectionsStateEnum.init) {
                    return const CustomIndicator();
                  }
                  if (state.collectionsState == CollectionsStateEnum.error) {
                    return CustomErrorWidget(textError: localizations.failedFetchCards);
                  }
                  if (state.collectionsState == CollectionsStateEnum.success) {
                    if (state.listCollections == null || state.listCollections!.isEmpty) {
                      return Center(
                        child: Text(
                          localizations.noData,
                          style: const TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    }
                    return _buildContent(state);
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

  Widget _buildContent(CardsCollectionsState state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.listCollections!.length,
      itemBuilder: (_, i) => state.listCollections != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider<CardsCollectionsBloc>.value(
                          value: BlocProvider.of<CardsCollectionsBloc>(context),
                          child: CollectionsScreen(
                            nameCollection: state.listCollections?[i].nameCollection ?? '',
                            isOldCollection: true,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          state.listCollections?[i].nameCollection ?? '',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${state.listCollections?[i].lenghtCollection.toString()}/10',
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: AppColors.white,
                      )
                    ],
                  )),
            )
          : Container(),
    );
  }
}
