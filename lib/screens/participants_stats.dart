import 'package:flutter/material.dart';

class ParticipantsStatsScreen extends StatefulWidget {
  @override
  _ParticipantsStatsScreenState createState() =>
      _ParticipantsStatsScreenState();
}

class _ParticipantsStatsScreenState extends State<ParticipantsStatsScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String gender = 'M';
  List<double> maleHeights = [];
  List<double> femaleHeights = [];
  List<int> ages = [];

  void addParticipant() {
    final height = double.tryParse(_heightController.text);
    final age = int.tryParse(_ageController.text);

    if (height == null || age == null || height < 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Datos inválidos o altura negativa para finalizar.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      if (gender == 'M') {
        maleHeights.add(height);
      } else {
        femaleHeights.add(height);
      }
      ages.add(age);
    });

    _heightController.clear();
    _ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estadísticas de Participantes')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (cm)'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad'),
            ),
            DropdownButton<String>(
              value: gender,
              items: ['M', 'F']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    gender = value;
                  });
                }
              },
            ),
            ElevatedButton(onPressed: addParticipant, child: Text('Agregar')),
          ],
        ),
      ),
    );
  }
}
