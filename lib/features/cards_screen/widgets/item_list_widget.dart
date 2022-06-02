import 'package:flutter/material.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/features/cards_screen/card_details_screen/card_details_screen.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import 'attribute_widget.dart';
import 'card_image_widget.dart';
import 'details_button.dart';

class ItemListCardsWidget extends StatefulWidget {
  final CardByParams cardByParams;

  const ItemListCardsWidget({required this.cardByParams, key}) : super(key: key);

  @override
  _ItemListCardsWidgetState createState() => _ItemListCardsWidgetState();
}

class _ItemListCardsWidgetState extends State<ItemListCardsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return Stack(
      children: [
        Column(
          children: [
            CardImageWidget(widget.cardByParams.img),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 30),
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.centerRight,
          child: Column(
            children: [
              _skillWidget(
                context,
                localizations.cost,
                widget.cardByParams.cost,
              ),
              _skillWidget(
                context,
                localizations.attack,
                widget.cardByParams.attack,
              ),
              _skillWidget(
                context,
                localizations.health,
                widget.cardByParams.health,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 32,
                child: DetailsButton(
                  key: Key(widget.cardByParams.cardId ?? ''),
                  onTap: () => Navigator.of(context).push(
                    CardDetailsScreen.getRoute('${widget.cardByParams.cardId}'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onPressedHandler() {
    if (animationController.isDismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}

Widget _skillWidget(BuildContext context, String title, int? skill) {
  double progress = skill?.toDouble() ?? 0.0;
  return Column(
    children: [
      const SizedBox(height: 5),
      Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      AttributeWidget(
        progress: progress * 10,
        customColor: skill != null
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.background.withOpacity(0.4),
        child: Text(
          skill?.toString() ?? '-',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
