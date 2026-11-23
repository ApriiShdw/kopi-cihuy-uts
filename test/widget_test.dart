import 'package:flutter_test/flutter_test.dart';
import 'package:uts_coffeeshop/main.dart';

void main() {
  testWidgets('Aplikasi Kopi Cihuy menampilkan katalog menu', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KopiCihuyApp());

    expect(find.text('Kopi Cihuy'), findsOneWidget);
    expect(find.text('Daftar Menu'), findsOneWidget);
    expect(find.text('Espresso'), findsOneWidget);
  });
}
