import 'package:flutter/material.dart';

class SumTo1000Screen extends StatefulWidget {
  @override
  _SumTo1000ScreenState createState() => _SumTo1000ScreenState();
}

class _SumTo1000ScreenState extends State<SumTo1000Screen> {
  final TextEditingController _numberController = TextEditingController();
  int _totalSum = 0;
  int _multiplesOfSix = 0;
  int _sumBetweenOneAndTen = 0;
  List<String> _enteredNumbers = [];

  // Función para procesar el número ingresado
  void _processNumber() {
    final int number = int.tryParse(_numberController.text) ?? 0;

    // Verifica si el número ingresado es válido
    if (number != 0) {
      setState(() {
        _totalSum += number;
        _enteredNumbers.add('Número ingresado: $number');

        // Verifica si el número es múltiplo de 6
        if (number % 6 == 0) {
          _multiplesOfSix++;
        }

        // Verifica si el número está entre 1 y 10 (inclusive)
        if (number >= 1 && number <= 10) {
          _sumBetweenOneAndTen += number;
        }
      });

      // Limpia el campo de texto
      _numberController.clear();

      // Si la suma total llega a 1000 o más, muestra un mensaje
      if (_totalSum >= 1000) {
        _showResultDialog();
      }
    }
  }

  // Muestra un diálogo con los resultados
  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Resultado Final'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Suma total: $_totalSum'),
              Text('Cantidad de múltiplos de 6: $_multiplesOfSix'),
              Text('Suma de números entre 1 y 10: $_sumBetweenOneAndTen'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _totalSum = 0;
                  _multiplesOfSix = 0;
                  _sumBetweenOneAndTen = 0;
                  _enteredNumbers.clear();
                });
              },
              child: Text('Reiniciar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Suma hasta 1000')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processNumber,
              child: Text('Agregar Número'),
            ),
            SizedBox(height: 20),
            Text(
              'Números ingresados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _enteredNumbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_enteredNumbers[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Suma total: $_totalSum',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
