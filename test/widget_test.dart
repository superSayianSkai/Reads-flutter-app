
import 'package:flutter_test/flutter_test.dart';

import 'package:be_calm/main.dart';

import 'package:be_calm/screens/home.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Home screen is displayed.
    expect(find.byType(Home), findsOneWidget);
  });
}
