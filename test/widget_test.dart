import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:praktikum_pab/pages/task_menu_page.dart';

void main() {
  testWidgets('Task menu shows Praktikum 4 entry', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskMenuPage()));

    expect(find.text('Praktikum 4'), findsOneWidget);
    expect(
      find.text('Menampilkan 20 gambar anjing dari Dog API'),
      findsOneWidget,
    );
  });
}
