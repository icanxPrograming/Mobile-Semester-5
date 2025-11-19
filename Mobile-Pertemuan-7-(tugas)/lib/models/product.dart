import 'package:flutter/material.dart';

class Product {
  String? nama;
  int harga;

  Product(this.nama, this.harga);
}

class Keranjang extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }

  int get totalHarga {
    int total = 0;
    for (var item in _items) {
      total += item.harga;
    }
    return total;
  }
}
