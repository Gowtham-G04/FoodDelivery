import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fooddelivery/main.dart';

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FoodDeliveryApp());

    // Verify that the initial text is 'Hi User'.
    expect(find.text('Hi User'), findsOneWidget);

    // Verify that the Search bar is present.
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the banner is present.
    expect(find.byType(Container), findsOneWidget);

    // Verify that the list of food items is present.
    expect(find.text('Pizza'), findsOneWidget);
    expect(find.text('Burger'), findsOneWidget);
    expect(find.text('Pasta'), findsOneWidget);

    // Verify that the 'Go to Cart' button is present.
    expect(find.text('Go to Cart'), findsOneWidget);
  });
}
