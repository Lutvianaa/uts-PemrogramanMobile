import 'package:flutter/material.dart';
import 'imt.dart';
import 'basal.dart';
import 'expenditure.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardDemo(),
    );
  }
}

class DashboardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Lutviana',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari informasi gizi',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        buildCard(
                          "Index Masa Tubuh",
                          "Ketahui status gizimu melalui perbandingan berat dan tinggi badan",
                          Colors.green,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IndexMasaTubuhPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                            ),
                            child: Text("Cek Sekarang"),
                          ),
                        ),
                        buildCard(
                          "Energi Basal",
                          "Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk menjalankan fungsi fisiologis tubuh",
                          Colors.orange,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnergiBasalPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.orange,
                              backgroundColor: Colors.white,
                            ),
                            child: Text("Cek Sekarang"),
                          ),
                        ),
                        buildCard(
                          "Energi Expenditure",
                          "Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk membertahankan kehidupan",
                          Colors.purple,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnergiExpenditurePage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.purple,
                              backgroundColor: Colors.white,
                            ),
                            child: Text("Cek Sekarang"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
      String title, String subtitle, Color cardColor, Widget button) {
    return Card(
      color: cardColor,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20, // Ubah ukuran teks sesuai kebutuhan
                fontWeight:
                    FontWeight.bold, // Ubah ketebalan teks sesuai kebutuhan
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16, // Ubah ukuran teks sesuai kebutuhan
                // Anda dapat mengatur ketebalan teks juga jika diperlukan
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.97, 0), // Mengatur tombol di kiri
            child: button,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
