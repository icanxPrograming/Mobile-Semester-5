import 'package:flutter/material.dart';
import 'package:mobile_p7/models/product.dart';
import 'package:mobile_p7/screens/halaman_keranjang.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Keranjang(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belanja',
      home: HalamanBelanja(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanBelanja extends StatelessWidget {
  const HalamanBelanja({super.key});

  Widget buildBadge(Widget icon, int count) {
    return Stack(
      children: [
        icon,
        if (count > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product("AMD Ryzen 5 5600X", 2500000),
      Product("Intel I3 13100", 1800000),
      Product("Nvidia Geforce RTX 5090", 23000000),
      Product("AMD Radeon RX 6600", 4500000),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Produk"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Consumer<Keranjang>(
            builder: (context, keranjang, child) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HalamanKeranjang()),
                  );
                },
                icon: buildBadge(
                  Icon(Icons.shopping_bag, size: 30),
                  keranjang.items.length,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              title: Text(data.nama ?? 'Name Not Found'),
              subtitle: Text("Rp ${data.harga}"),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<Keranjang>(context, listen: false).add(data);
                },
                icon: Icon(Icons.shopping_cart_checkout),
              ),
            ),
          );
        },
      ),
    );
  }
}
