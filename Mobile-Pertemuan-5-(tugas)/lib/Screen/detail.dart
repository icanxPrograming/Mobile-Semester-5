import 'package:flutter/material.dart';
import 'package:mobile_p5/Model/menu.dart';

class Detail extends StatelessWidget {
  final Menu elektronik;
  final int i;

  const Detail({super.key, required this.elektronik, required this.i});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(elektronik.nama[i], style: const TextStyle(fontSize: 18)),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1, // 1:1 agar proporsional di semua device
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(elektronik.gambar[i], fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              elektronik.nama[i],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              elektronik.deskripsi[i],
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
