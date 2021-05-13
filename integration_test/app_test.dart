import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// The application under test.
import 'package:integ_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button; verify counter', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final testKey = Key("increment");

      // Finds the floating action button to tap on.
      final Finder fab = find.byKey(testKey);

      // Emulate a tap on the floating action button.
      await tester.tap(fab);
      print('Button incremente');

      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });
  });
}