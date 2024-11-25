import 'package:flutter/material.dart';
import 'screens/random_multiples.dart';
import 'screens/check_prime.dart';
import 'screens/participants_stats.dart';
import 'screens/roulette_analysis.dart';
import 'screens/temperature_analysis.dart';
import 'screens/sum_to_1000.dart';

void main() {
  runApp(const MyApp()); // Aquí se usa 'const' porque el constructor de MyApp ahora es constante.
}

class MyApp extends StatelessWidget {
  // Se marca el constructor como 'const'
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grupo 3 - App con componentes visuales ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grupo 3 - App con componentes visuales')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('1. Generar Múltiplos de 5'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RandomMultiplesScreen()),
            ),
          ),
          ListTile(
            title: const Text('2. Determinar si un número es primo'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckPrimeScreen()),
            ),
          ),
          ListTile(
            title: const Text('3. Estadísticas de Participantes'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParticipantsStatsScreen()),
            ),
          ),
          ListTile(
            title: const Text('4. Análisis de la Ruleta'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RouletteAnalysisScreen()),
            ),
          ),
          ListTile(
            title: const Text('5. Análisis de Temperaturas'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TemperatureAnalysisScreen()),
            ),
          ),
          ListTile(
            title: const Text('6. Suma hasta 1000'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SumTo1000Screen()),
            ),
          ),
        ],
      ),
    );
  }
}
