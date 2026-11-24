import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('MyPortfolio renders home page', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));
    await tester.pumpAndSettle();

    expect(find.text('MyPortfolio'), findsOneWidget);
  });
}
