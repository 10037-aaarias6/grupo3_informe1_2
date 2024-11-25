import 'dart:math';
import 'package:flutter/material.dart';

class RandomMultiplesScreen extends StatefulWidget {
  @override
  _RandomMultiplesScreenState createState() => _RandomMultiplesScreenState();
}

class _RandomMultiplesScreenState extends State<RandomMultiplesScreen> {
  String randomNumber = '';

  void generateNumber() {
    final random = Random();
    setState(() {
      randomNumber = (random.nextInt(200) ~/ 5 * 5).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generar Múltiplos de 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              randomNumber.isEmpty ? 'Presiona para generar' : 'Número: $randomNumber',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateNumber,
              child: Text('Generar Número'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
