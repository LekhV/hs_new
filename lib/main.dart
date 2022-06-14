import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hs/infrastructure/injectable.dart';
import 'package:flutter_hs/utils/persist_storage.dart';

import 'application.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  final token = await persistStorage.getStringForKey(USER_TOKEN) ?? '';

  runApp(MyApp(token));
}
