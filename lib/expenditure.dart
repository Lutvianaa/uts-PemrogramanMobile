import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: EnergiExpenditurePage(),
  ));
}

class EnergiExpenditurePage extends StatefulWidget {
  @override
  _EnergiExpenditurePageState createState() => _EnergiExpenditurePageState();
}

class _EnergiExpenditurePageState extends State<EnergiExpenditurePage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  double expenditureEnergy = 0.0;
  bool isMale = true; // Ganti dengan false jika perempuan
  double activityLevel =
      1.2; // Ganti sesuai tingkat aktivitas (1.2 adalah tingkat aktivitas rendah)

  void calculateExpenditureEnergy() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    int age = int.tryParse(ageController.text) ?? 0;

    if (weight > 0 && height > 0 && age > 0) {
      if (isMale) {
        expenditureEnergy = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      } else {
        expenditureEnergy = (10 * weight) + (6.25 * height) - (5 * age) - 161;
      }

      expenditureEnergy *= activityLevel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Energi Expenditure'),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple[100],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Berat (kg)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi (cm)'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Usia'),
            ),
            Row(
              children: <Widget>[
                Text('Jenis Kelamin: '),
                Radio(
                  value: true,
                  groupValue: isMale,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        isMale = value;
                      });
                    }
                  },
                ),
                Text('Laki-laki'),
                Radio(
                  value: false,
                  groupValue: isMale,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        isMale = value;
                      });
                    }
                  },
                ),
                Text('Perempuan'),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Tingkat Aktivitas: '),
                DropdownButton<double>(
                  value: activityLevel,
                  onChanged: (double? value) {
                    if (value != null) {
                      setState(() {
                        activityLevel = value;
                      });
                    }
                  },
                  items: [
                    DropdownMenuItem<double>(
                      value: 1.2,
                      child: Text('Rendah (1.2)'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.375,
                      child: Text('Ringan (1.375)'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.55,
                      child: Text('Sedang (1.55)'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.725,
                      child: Text('Berat (1.725)'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.9,
                      child: Text('Sangat Berat (1.9)'),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                calculateExpenditureEnergy();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Hasil Energi Expenditure'),
                      content: Text(
                          'Energi Expenditure Anda: ${expenditureEnergy.toStringAsFixed(2)} kkal/hari'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Hitung Energi Expenditure'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
