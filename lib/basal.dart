import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: EnergiBasalPage(),
  ));
}

class EnergiBasalPage extends StatefulWidget {
  @override
  _EnergiBasalPageState createState() => _EnergiBasalPageState();
}

class _EnergiBasalPageState extends State<EnergiBasalPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  double basalEnergy = 0.0;
  bool isMale = true; // Ganti dengan false jika perempuan

  void calculateBasalEnergy() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    int age = int.tryParse(ageController.text) ?? 0;

    if (weight > 0 && height > 0 && age > 0) {
      if (isMale) {
        basalEnergy =
            88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      } else {
        basalEnergy =
            447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Energi Basal'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.orange[50],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Berat Badan:\n'),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Berat (kg)',
                  filled: true,
                  fillColor: Colors.white),
            ),
            Text('\nTinggi Badan:\n'),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
                  filled: true,
                  fillColor: Colors.white),
            ),
            Text('\nUsia:\n'),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Usia', filled: true, fillColor: Colors.white),
            ),
            Row(
              children: <Widget>[
                Text('Jenis Kelamin: '),
                Radio(
                  value: true,
                  groupValue: isMale,
                  onChanged: (bool? value) {
                    // Ketika radio button laki-laki dipilih
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
                    // Ketika radio button perempuan dipilih
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
            ElevatedButton(
              onPressed: () {
                calculateBasalEnergy();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Hasil Energi Basal'),
                      content: Text(
                          'Energi Basal Anda: ${basalEnergy.toStringAsFixed(2)} kkal/hari'),
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
              child: Text('Hitung Energi Basal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
