import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_hs/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Main tests', () {
    testWidgets('Test run', (tester) async {
      app.main();
      await pumpAndSettleCount(tester, 2);

      await tester.pump(twoSeconds);

      final moreButton = find.byIcon(Icons.adaptive.more);
      final darkModeButton = find.byKey(const Key('darkModeButton'));
      final lightModeButton = find.byKey(const Key('lightModeButton'));

      await tester.pumpAndSettle();
      await tester.tap(moreButton);
      await tester.pumpAndSettle();
      await tester.tap(darkModeButton);
      await tester.pumpAndSettle();

      await tester.pump(twoSeconds);

      await tester.tap(moreButton);
      await tester.pumpAndSettle();
      await tester.tap(lightModeButton);
      await tester.pumpAndSettle();

      await tester.pump(twoSeconds);
    });
  });
}

Future<void> pumpAndSettleCount(
  WidgetTester tester,
  int count,
) async {
  for (var i = 0; i < count; ++i) {
    await tester.pumpAndSettle();
  }
}

const twoSeconds = Duration(seconds: 2);
