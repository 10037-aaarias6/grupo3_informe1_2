import 'package:flutter/material.dart';

class CheckPrimeScreen extends StatefulWidget {
  @override
  _CheckPrimeScreenState createState() => _CheckPrimeScreenState();
}

class _CheckPrimeScreenState extends State<CheckPrimeScreen> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void checkPrime() {
    final number = int.tryParse(_controller.text);
    if (number == null) {
      setState(() {
        result = 'Por favor, ingresa un número válido.';
      });
    } else {
      setState(() {
        result = isPrime(number)
            ? '$number es un número primo.'
            : '$number no es un número primo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Número Primo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingresa un número'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkPrime, child: Text('Verificar')),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
