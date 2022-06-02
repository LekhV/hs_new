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

      final menuButton = find.byIcon(Icons.menu);
      final classesButton = find.text('Classes');
      final mageButton = find.text('Mage');
      final seeDetailsButton = find.byKey(const Key('HERO_08b'));

      await tester.pumpAndSettle();
      await tester.tap(menuButton);
      await tester.pumpAndSettle();
      await tester.tap(classesButton);
      await tester.pumpAndSettle();
      await tester.tap(mageButton);
      await tester.pumpAndSettle();
      await tester.tap(seeDetailsButton);

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
