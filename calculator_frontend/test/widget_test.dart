import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_frontend/main.dart';

void main() {
  testWidgets('Displays Calculator header and keypad buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('Calculator'), findsOneWidget);
    // Check some essential buttons
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('÷'), findsOneWidget);
    expect(find.text('×'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
  });

  testWidgets('Simple addition flow works visually', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('='));
    await tester.pumpAndSettle();

    // Should show result labeled line and current input as 3
    expect(find.text('= 3'), findsWidgets);
    expect(find.text('3'), findsWidgets);
  });
}
