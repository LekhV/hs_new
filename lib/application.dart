import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'darwer/bloc/info_hs_bloc.dart';
import 'darwer/drawer_screen.dart';
import 'features/auth/bloc/login_bloc.dart';
import 'features/auth/login_screen.dart';

import 'infrastructure/theme/dark_theme.dart';
import 'infrastructure/theme/light_theme.dart';

class MyApp extends StatefulWidget {
  final String token;

  const MyApp(this.token, {Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MaterialApp(
      themeMode: _themeMode,
      theme: getDarkTheme(context),
      darkTheme: getLightTheme(context),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: widget.token.isNotEmpty
          ? BlocProvider<InfoHSBloc>(
              create: (BuildContext context) => InfoHSBloc(),
              child: const DrawerScreen(),
            )
          : BlocProvider<LoginBloc>(
              create: (BuildContext context) => LoginBloc(),
              child: const LoginScreen(),
            ),
    );
    return MultiProvider(
      providers: [
        Provider.value(value: this),
        Provider.value(value: _themeMode),
      ],
      child: child,
    );
  }
}
