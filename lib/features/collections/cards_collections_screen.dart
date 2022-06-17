import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

import 'package:flutter_hs/ui_kit/background_container.dart';

import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/cards_collections_bloc.dart';
import 'new_collections_screen/new_collections_screen.dart';
import 'old_collections_screen.dart/old_collections_screen.dart';

class CardsCollectionsScreen extends StatefulWidget {
  static const _routeName = '/cards_collections';

  static MaterialPageRoute getRoute(List<String> classes) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => CardsCollectionsScreen(
        classes: classes,
      ),
      // TODO : Add BlocProvider in Drawer
      //  BlocProvider<CardsCollectionsBloc>(
      //   create: (BuildContext context) => CardsCollectionsBloc(),
      //   child: CardsCollectionsScreen(
      //     classes: classes,
      //   ),
      // ),
    );
  }

  const CardsCollectionsScreen({
    required this.classes,
    Key? key,
  }) : super(key: key);

  final List<String> classes;

  @override
  _CardsCollectionsScreenState createState() => _CardsCollectionsScreenState();
}

class _CardsCollectionsScreenState extends State<CardsCollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations!;

    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          children: [
            AppBar(
              title: Text(localizations.cardsCollections),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            const SizedBox(height: 27),
            _customButton(
              title: localizations.createCardsCollection,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider<CardsCollectionsBloc>.value(
                    value: BlocProvider.of<CardsCollectionsBloc>(context),
                    child: NewCollectionsScreen(
                      parameter: widget.classes.first,
                      title: widget.classes.first,
                      classes: widget.classes,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 27),
            _customButton(
              title: localizations.showCardsCollections,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider<CardsCollectionsBloc>.value(
                    value: BlocProvider.of<CardsCollectionsBloc>(context),
                    child: OldCollectionsScreen(
                      parameter: widget.classes.first,
                      title: widget.classes.first,
                      classes: widget.classes,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton({required String title, required VoidCallback onTap}) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: OutlinedButton(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
