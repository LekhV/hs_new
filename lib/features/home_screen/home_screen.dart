import 'package:flutter/material.dart';

import 'package:flutter_hs/config.dart';
import 'package:flutter_hs/features/cards_screen/cards_screen.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/card_details_image.dart';
import 'package:flutter_hs/ui_kit/title_widget.dart';

class HomeScreen extends StatefulWidget {
  static const _routeName = '/home';
  static MaterialPageRoute getRoute({List<String>? list, String? routeText}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => HomeScreen(
        list: list!,
        routeText: routeText,
      ),
    );
  }

  const HomeScreen({required this.list, required this.routeText, key}) : super(key: key);
  final List<String> list;
  final String? routeText;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              CardDetailsImage(
                config.mainImgHs,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.list.length,
                itemBuilder: (_, i) => _itemBuilder(i),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          CardsScreen.getRoute('${widget.routeText}/${widget.list[index]}', widget.list[index]),
        ),
        child: TitleWidget(
          widget.list[index],
        ),
      ),
    );
  }
}
