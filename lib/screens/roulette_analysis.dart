import 'package:flutter/material.dart';

class RouletteAnalysisScreen extends StatefulWidget {
  @override
  _RouletteAnalysisScreenState createState() => _RouletteAnalysisScreenState();
}

class _RouletteAnalysisScreenState extends State<RouletteAnalysisScreen> {
  final TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  String result = '';

  void analyzeRoulette() {
    int oddCount = 0;
    int evenSum = 0;
    int evenCount = 0;
    int secondDozenCount = 0;
    int maxNumber = numbers.isNotEmpty ? numbers[0] : 0;

    for (var number in numbers) {
      if (number % 2 != 0) oddCount++;
      if (number % 2 == 0 && number != 0) {
        evenSum += number;
        evenCount++;
      }
      if (number >= 13 && number <= 24) secondDozenCount++;
      if (number > maxNumber) maxNumber = number;
    }

    final evenAverage = evenCount > 0 ? evenSum / evenCount : 0;

    setState(() {
      result = '''
Cantidad de números impares: $oddCount
Promedio de números pares (sin contar ceros): $evenAverage
Cantidad en la 2da docena (13-24): $secondDozenCount
Número más grande: $maxNumber
''';
    });
  }

  void addNumber() {
    final number = int.tryParse(_controller.text);
    if (number == null || number < 0 || number > 36) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un número válido (0-36).')),
      );
      return;
    }
    setState(() {
      numbers.add(number);
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Análisis de la Ruleta')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingresa un número (0-36)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: addNumber, child: Text('Agregar')),
                ElevatedButton(onPressed: analyzeRoulette, child: Text('Analizar')),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Text(
                result,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
