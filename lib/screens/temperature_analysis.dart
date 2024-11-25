import 'package:flutter/material.dart';

class TemperatureAnalysisScreen extends StatefulWidget {
  @override
  _TemperatureAnalysisScreenState createState() =>
      _TemperatureAnalysisScreenState();
}

class _TemperatureAnalysisScreenState
    extends State<TemperatureAnalysisScreen> {
  final TextEditingController _t1Controller = TextEditingController();
  final TextEditingController _t2Controller = TextEditingController();
  List<String> _temperatureLogs = [];
  double _averageTemperature = 0.0;
  int _validTemperatureCount = 0;

  // Función para agregar temperaturas y calcular el promedio.
  void _processTemperatures() {
    final double t1 = double.tryParse(_t1Controller.text) ?? 0.0;
    final double t2 = double.tryParse(_t2Controller.text) ?? 0.0;

    // Verifica si las temperaturas están dentro del rango.
    if (t1 != 0 && t2 != 0) {
      if (t1 >= 5 && t1 <= 15) {
        _validTemperatureCount++;
        _averageTemperature += t1;
      }
      if (t2 >= 5 && t2 <= 15) {
        _validTemperatureCount++;
        _averageTemperature += t2;
      }
    }

    // Agrega las temperaturas al registro.
    setState(() {
      _temperatureLogs.add('T1: $t1, T2: $t2');
    });

    // Calcula el promedio si hay temperaturas válidas.
    if (_validTemperatureCount > 0) {
      _averageTemperature /= _validTemperatureCount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Análisis de Temperaturas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _t1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura 1 (T1)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _t2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura 2 (T2)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processTemperatures,
              child: Text('Agregar Temperaturas'),
            ),
            SizedBox(height: 20),
            Text(
              'Temperaturas ingresadas:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _temperatureLogs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_temperatureLogs[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Promedio de temperaturas entre 5° y 15°: ${_validTemperatureCount > 0 ? _averageTemperature.toStringAsFixed(2) : "N/A"}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
