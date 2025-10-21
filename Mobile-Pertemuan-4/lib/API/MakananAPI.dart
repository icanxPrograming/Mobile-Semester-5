// Buat koneksi API
import 'dart:convert';

import 'package:mobile_p4/Model/makanan_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Url API
  static const _url =
      "https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian";

  // Ambil data from API (tahan data sampai semua terkumpul)
  Future<List<Makanan>> fecthMakanan() async {
    final respon = await http.get(Uri.parse(_url));
    try {
      if (respon.statusCode == 200) {
        // Jika data didapatkan
        final Map<String, dynamic> json = jsonDecode(
          respon.body,
        ); // ubah string menjadi JSON
        final List<dynamic> makananJson = json['meals'];
        return makananJson.map((json) => Makanan.fromJson(json)).toList();
      } else {
        // Jika data tidak didapatkan
        throw Exception("Error Mas!! Data tidak didapatkan");
      }
    } catch (e) {
      // Jika gagal koneksi
      throw Exception("Konesi Gagal!");
    }
  }
}
