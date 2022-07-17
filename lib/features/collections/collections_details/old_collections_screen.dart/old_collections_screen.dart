import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/theme/app_colors.dart';
import '../../bloc/cards_collections_bloc.dart';
import '../../bloc/cards_collections_event.dart';
import '../../bloc/cards_collections_state.dart';
import '../../collection_content_enum.dart';
import '../../widgets/collection_app_bar.dart';
import '../../widgets/collection_error_widget.dart';

class OldCollectionsScreen extends StatefulWidget {
  const OldCollectionsScreen({
    required this.state,
    required this.classes,
    Key? key,
  }) : super(key: key);

  final CardsCollectionsState state;
  final List<String> classes;

  @override
  State<OldCollectionsScreen> createState() => _OldCollectionsScreenState();
}

class _OldCollectionsScreenState extends State<OldCollectionsScreen> {
  String title = '';
  CardsCollectionsBloc get bloc => BlocProvider.of<CardsCollectionsBloc>(context);

  @override
  void initState() {
    super.initState();
    title = widget.state.parameter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionAppBar(
          title: title,
          contentEnum: CollectionsContentEnum.initialScreen,
          classes: widget.classes,
          onPressActions: (item) {
            setState(() {
              title = item;
            });
            bloc.add(GetCollections(item));
          },
        ),
        if (widget.state.listCollections == null || widget.state.listCollections!.isEmpty) ...{
          const CollectionErrorWidget(),
        } else ...{
          _contentBuild(context),
        }
      ],
    );
  }

  Widget _contentBuild(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.state.listCollections!.length,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () {
            bloc.add(const ChangeContent(typeContent: CollectionsContentEnum.oldCollection));
            bloc.add(
              GetCardsCollection(
                nameCollection: widget.state.listCollections?[i].nameCollection ?? '',
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(widget.state.listCollections?[i].nameCollection ?? '')),
              const SizedBox(width: 10),
              Text('${widget.state.listCollections?[i].collectionCards!.length.toString()}/10'),
              const Icon(Icons.arrow_right, color: AppColors.white)
            ],
          ),
        ),
      ),
    );
  }
}
