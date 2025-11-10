import 'package:flutter/material.dart';
import 'package:mobile_p6/models/produk_model.dart';
import 'package:mobile_p6/details/detail_page.dart';

Widget buildListView(BuildContext context) {
  Produk data = Produk();
  return ListView.builder(
    itemCount: data.produkData.length,
    itemBuilder: (context, index) {
      final item = data.produkData[index];
      return Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Image.network(
            item['gambar'] ?? '',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          title: Text(item['nama'] ?? ''),
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
        ),
      );
    },
  );
}
