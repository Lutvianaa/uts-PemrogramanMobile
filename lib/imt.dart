import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IndexMasaTubuhPage(),
  ));
}

class IndexMasaTubuhPage extends StatefulWidget {
  @override
  _IndexMasaTubuhPageState createState() => _IndexMasaTubuhPageState();
}

class _IndexMasaTubuhPageState extends State<IndexMasaTubuhPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool isMale = true;
  double imt = 0.0;
  double carbRequirement = 0.0;
  double fatRequirement = 0.0;
  double proteinRequirement = 0.0;

  void calculateIMT() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    int age = int.tryParse(ageController.text) ?? 0;

    if (weight > 0 && height > 0 && age > 0) {
      double heightInMeters = height / 100;
      imt = weight / (heightInMeters * heightInMeters);

      // Hitung kebutuhan nutrisi berdasarkan IMT
      // Anda dapat menyesuaikan rumus sesuai dengan kebutuhan gizi Anda
      if (isMale) {
        carbRequirement = 10 * weight + 6.25 * height - 5 * age + 5;
        fatRequirement = 0.25 * carbRequirement;
        proteinRequirement = 0.15 * carbRequirement;
      } else {
        carbRequirement = 10 * weight + 6.25 * height - 5 * age - 161;
        fatRequirement = 0.25 * carbRequirement;
        proteinRequirement = 0.15 * carbRequirement;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator IMT'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.lightGreen[100],
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
            ElevatedButton(
              onPressed: () {
                calculateIMT();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Hasil Perhitungan Indeks Massa Tubuh Anda'),
                      content: Text('IMT Anda: ${imt.toStringAsFixed(2)}\n\n' +
                          'Anda memerlukan:\n' +
                          'Kebutuhan karbohidrat sebanyak ${carbRequirement.toStringAsFixed(2)} gram\n' +
                          'Kebutuhan lemak sebanyak ${fatRequirement.toStringAsFixed(2)} gram\n' +
                          'Kebutuhan protein sebanyak ${proteinRequirement.toStringAsFixed(2)} gram'),
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
              child: Text('Lihat Hasil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
