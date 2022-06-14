import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/application.dart';
import 'package:flutter_hs/features/auth/bloc/login_bloc.dart';
import 'package:flutter_hs/features/auth/login_screen.dart';
import 'package:flutter_hs/features/cardbacks_screen/cardbacks_screen.dart';
import 'package:flutter_hs/features/cards_screen/serach_cards_screen/search_cards_screen.dart';
import 'package:flutter_hs/features/home_screen/home_screen.dart';
import 'package:flutter_hs/features/user_profile/bloc/user_profile_bloc.dart';
import 'package:flutter_hs/features/user_profile/user_profile_screen.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/ui_kit/card_details_image.dart';
import 'package:flutter_hs/ui_kit/custom_error_widget.dart';
import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../config.dart';
import 'bloc/info_hs_bloc.dart';
import 'bloc/info_hs_event.dart';
import 'bloc/info_hs_state.dart';

class DrawerScreen extends StatefulWidget {
  final String? title;

  const DrawerScreen({Key? key, this.title}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> with WidgetsBindingObserver {
  List<String> _list = [];
  String _routeText = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<InfoHSBloc>(context).add(InfoHSFetched());
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<InfoHSBloc>(context).add(InfoHSFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

    final localizations = context.localizations!;
    return BlocConsumer<InfoHSBloc, InfoHSState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pop(context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => BlocProvider<LoginBloc>(
                  create: (BuildContext context) => LoginBloc(),
                  child: const LoginScreen(),
                ),
              ),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        if (state is InfoHSInitial) {
          return const CustomIndicator();
        }
        if (state is InfoHSFailure) {
          return const CustomErrorWidget();
        }
        if (state is InfoHSSuccess) {
          if (state.infoHSs == null) {
            return CustomErrorWidget(
              textError: localizations.noData,
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.hearthstone),
              actions: [
                PopupMenuButton<ThemeMode>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      key: const Key('lightModeButton'),
                      value: ThemeMode.light,
                      child: Text(localizations.lightMode),
                    ),
                    PopupMenuItem(
                      key: const Key('darkModeButton'),
                      value: ThemeMode.dark,
                      child: Text(localizations.darkMode),
                    ),
                  ],
                  onSelected: (themeMode) {
                    context.read<MyAppState>().setThemeMode(themeMode);
                  },
                ),
              ],
            ),
            body: HomeScreen(list: _list, routeText: _routeText),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: CardDetailsImage(
                      config.mainImgHs,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      localizations.searchCards,
                      style: defaultTextStyle,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(SearchCardsScreen.getRoute());
                    },
                  ),
                  _itemDrawer(
                    title: localizations.classes,
                    routeText: localizations.classes.toLowerCase(),
                    itemList: state.infoHSs!.classes,
                  ),
                  _itemDrawer(
                    title: localizations.types,
                    routeText: localizations.types.toLowerCase(),
                    itemList: state.infoHSs!.types,
                  ),
                  _itemDrawer(
                    title: localizations.sets,
                    routeText: localizations.sets.toLowerCase(),
                    itemList: state.infoHSs!.sets,
                  ),
                  _itemDrawer(
                    title: localizations.races,
                    routeText: localizations.races.toLowerCase(),
                    itemList: state.infoHSs!.races,
                  ),
                  _itemDrawer(
                    title: localizations.qualities,
                    routeText: localizations.qualities.toLowerCase(),
                    itemList: state.infoHSs!.qualities,
                  ),
                  _itemDrawer(
                    title: localizations.factions,
                    routeText: localizations.factions.toLowerCase(),
                    itemList: state.infoHSs!.factions,
                  ),
                  ListTile(
                    title: Text(
                      localizations.cardBacks,
                      style: defaultTextStyle,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        CardBacksScreen.getRoute(),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Profile',
                      style: defaultTextStyle,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<UserProfileBloc>(
                            create: (BuildContext context) => UserProfileBloc(),
                            child: const UserProfileScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      localizations.logOut,
                      style: defaultTextStyle,
                    ),
                    onTap: () {
                      BlocProvider.of<InfoHSBloc>(context).add(LogoutEvent());
                    },
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

  Widget _itemDrawer({String? title, String? routeText, List<String>? itemList}) {
    const defaultTextStyle = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    return ListTile(
      title: Text(
        title ?? '',
        style: defaultTextStyle,
      ),
      onTap: () {
        setState(() {
          _routeText = routeText ?? '';
          _list = itemList ?? [];
        });
        Navigator.pop(context);
      },
    );
  }
}
