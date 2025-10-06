import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NameCard());
}

class NameCard extends StatelessWidget {
  const NameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Flutter Kartu Nama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CardScreen(),
    );
  }
}

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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',
              ),
            ),
            SizedBox(height: 20),
            Text(
              style: GoogleFonts.inter(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              'Muhammad Ikhsan',
            ),
            SizedBox(height: 10),
            Text(
              '"Call Me Ican"',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Mahasiswa & Junior Programmer',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(style: GoogleFonts.poppins(), "081808313324"),
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                leading: Icon(Icons.mail),
                title: Text(
                  style: GoogleFonts.poppins(),
                  "isan.mhmd004@gmail.com",
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                leading: Icon(Icons.maps_home_work),
                title: Text(
                  style: GoogleFonts.poppins(),
                  "Kp. Ciwalen Pasar, Kec. Sukaresmi, Kab. Cianjur, Jawa Barat",
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(style: GoogleFonts.poppins(), "@si.icannn"),
                trailing: Icon(Icons.star),
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                leading: Icon(Icons.facebook),
                title: Text(style: GoogleFonts.poppins(), "Muhammad Ikhsan"),
                trailing: Icon(Icons.star),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
