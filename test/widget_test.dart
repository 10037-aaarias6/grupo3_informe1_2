import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled1/main.dart'; // Importa el main.dart del proyecto

void main() {
  testWidgets('Smoke test: Counter increments', (WidgetTester tester) async {
    // Construye la aplicación y dispara un frame.
    await tester.pumpWidget(const MyApp());

    // Verifica que el texto 'Hello World' esté presente.
    expect(find.text('Hello World'), findsOneWidget);

    // En este caso no hay botón de incremento porque no es un contador.
    // Modifica las pruebas según tu app.
  });
}
