import 'package:flutter/material.dart';
import 'package:mobile_p7/models/product.dart';
import 'package:provider/provider.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Belanja"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<Keranjang>(
        builder: (context, value, child) {
          if (value.items.isEmpty) {
            return Center(
              child: Text(
                "Keranjang Anda Kosong",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
            itemCount: value.items.length,
            itemBuilder: (context, index) {
              var data = value.items[index];

              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(
                    data.nama ?? "Produk",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Rp ${data.harga}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Provider.of<Keranjang>(
                        context,
                        listen: false,
                      ).remove(data);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${data.nama} dihapus dari keranjang"),
                          duration: Duration(milliseconds: 800),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: Consumer<Keranjang>(
        builder: (context, keranjang, child) {
          return Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp ${keranjang.totalHarga}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
