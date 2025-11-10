import 'package:flutter/material.dart';
import 'package:mobile_p6/models/produk_model.dart';
import 'package:mobile_p6/details/detail_page.dart';

Widget buildGridView(BuildContext context) {
  Produk data = Produk();
  return GridView.builder(
    padding: const EdgeInsets.all(10),
    itemCount: data.produkData.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 5,
    ),
    itemBuilder: (context, index) {
      final item = data.produkData[index];
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                nama: item['nama'] ?? '',
                gambar: item['gambar'] ?? '',
                deskripsi: item['deskripsi'] ?? '',
              ),
            ),
          );
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(item['gambar'] ?? '', fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Text(item['nama'] ?? '', textAlign: TextAlign.center),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
