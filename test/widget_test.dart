import 'package:desafiocubos/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyTest', (WidgetTester tester) async {
    await tester.pumpWidget(const EmptyApp());
  });
}
