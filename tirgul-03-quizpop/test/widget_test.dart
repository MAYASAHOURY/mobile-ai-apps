import 'package:flutter_test/flutter_test.dart';

import 'package:quizpop/main.dart';

void main() {
  testWidgets('home screen shows the stations', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('תרגול 3 · מאיה'), findsOneWidget);
    expect(find.text('QuizPop · חידון'), findsOneWidget);
  });
}
