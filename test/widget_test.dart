import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tutorsearch_app/main.dart';

void main() {
  testWidgets('La aplicación inicia correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ViveroApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
