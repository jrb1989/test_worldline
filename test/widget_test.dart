import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_worldline/presentation/home/widgets/custom_text_field.dart';

void main() {
  testWidgets('CustomTextField displays correctly', (WidgetTester tester) async {
    // Build the CustomTextField widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomTextField(),
        ),
      ),
    );

    // Find the CustomTextField widget
    final customTextFieldFinder = find.byType(CustomTextField);
    expect(customTextFieldFinder, findsOneWidget);

    // Find the TextField widget within CustomTextField
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Verify the TextField properties
    expect(
      find.descendant(
        of: textFieldFinder,
        matching: find.text('Search by title'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: textFieldFinder,
        matching: find.byIcon(Icons.search_outlined),
      ),
      findsOneWidget,
    );
    // Add additional verification for other properties as needed
  });

  testWidgets('CustomTextField onChanged callback is triggered', (WidgetTester tester) async {
    String? textFieldValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            onChanged: (value) {
              textFieldValue = value;
            },
          ),
        ),
      ),
    );

    // Find the TextField widget
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Enter text into the TextField
    await tester.enterText(textFieldFinder, 'Test Text');

    // Verify that the onChanged callback was triggered and the value was updated
    expect(textFieldValue, 'Test Text');
  });
}
