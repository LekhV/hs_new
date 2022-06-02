import 'package:flutter/material.dart';
import 'package:flutter_hs/domain/cardbacks/models/cardback.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/card_details_image.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';
import 'package:flutter_hs/utils/persist_storage.dart';

class CardBackDetailsScreen extends StatelessWidget {
  static const _routeName = '/card_back_details';

  static MaterialPageRoute getRoute(CardBack cardBack) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => CardBackDetailsScreen(cardBack: cardBack),
    );
  }

  const CardBackDetailsScreen({required this.cardBack, Key? key}) : super(key: key);
  final CardBack cardBack;

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
    final localizations = context.localizations!;

    return Scaffold(
      body: BackgroundContainer(
        child: ListView(
          children: [
            AppBar(
              title: Text(
                cardBack.name!,
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            CardDetailsImage(cardBack.img),
            const Divider(color: Colors.transparent),
            Text(
              cardBack.description ?? '',
              style: defaultTextStyle,
            ),
            const Divider(color: Colors.transparent),
            Text(
              localizations.howToGet,
              textAlign: TextAlign.center,
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.transparent),
            Text(
              cardBack.howToGet ?? localizations.ooopsByNoMeans,
              style: defaultTextStyle,
            ),
            const Divider(color: Colors.transparent),
            _buttonBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonBuilder(BuildContext context) {
    return SizedBox(
      height: 54,
      child: OutlinedButton(
        child: Text(
          context.localizations!.chooseAsMain,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        onPressed: () {
          persistStorage.setStringForKey(
            PREFERENCES_CARDBACK,
            cardBack.img!,
          );
          _showMessage(context);
        },
        // style: ButtonStyle(
        //   side: MaterialStateProperty.all(
        //     const BorderSide(
        //       color: Colors.white,
        //       width: 1,
        //     ),
        //   ),
        //   shape: MaterialStateProperty.all(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(30.0),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.localizations!.cardbackChanged,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
