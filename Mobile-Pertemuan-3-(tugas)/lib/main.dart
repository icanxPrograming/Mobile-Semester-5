import 'package:flutter/material.dart';

void main() {
  runApp(const CalcBMI());
}

class CalcBMI extends StatelessWidget {
  const CalcBMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      home: const BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _berat = TextEditingController();
  final _tinggi = TextEditingController();

  String? _gender;
  double? _hasil;
  String? _kategori;

  void _hitungBMI() {
    final double weight = double.tryParse(_berat.text) ?? 0;
    final double height = double.tryParse(_tinggi.text) ?? 0;

    setState(() {
      if (weight > 0 && height > 0 && _gender != null) {
        final double heightInM = height / 100;
        final double bmi = weight / (heightInM * heightInM);
        _hasil = bmi;

        if (_gender == 'Laki-laki') {
          if (bmi < 18.5) {
            _kategori = "Kurus";
          } else if (bmi < 25) {
            _kategori = "Ideal";
          } else if (bmi < 30) {
            _kategori = "Gemuk";
          } else {
            _kategori = "Obesitas";
          }
        } else if (_gender == 'Perempuan') {
          if (bmi < 18) {
            _kategori = "Kurus";
          } else if (bmi < 24) {
            _kategori = "Ideal";
          } else if (bmi < 29) {
            _kategori = "Gemuk";
          } else {
            _kategori = "Obesitas";
          }
        }
      } else {
        _hasil = null;
        _kategori = "Masukkan data yang valid dan pilih jenis kelamin!";
      }
    });
  }

  void _reset() {
    setState(() {
      _berat.clear();
      _tinggi.clear();
      _hasil = null;
      _kategori = null;
      _gender = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Kalkulator BMI",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _berat,
              decoration: const InputDecoration(
                labelText: 'Berat Badan (kg)',
                prefixIcon: Icon(Icons.monitor_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _tinggi,
              decoration: const InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            const Text(
              "Pilih Jenis Kelamin:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _gender = "Laki-laki";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gender == "Laki-laki"
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  child: const Text("Laki-laki"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _gender = "Perempuan";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gender == "Perempuan"
                        ? Colors.pink
                        : Colors.grey,
                  ),
                  child: const Text("Perempuan"),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _hitungBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
              ),
              child: const Text("Hitung BMI"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
              ),
              child: const Text("Reset"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Hasil BMI:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    _hasil != null ? _hasil!.toStringAsFixed(1) : '---',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _kategori ?? 'Masukkan data',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
