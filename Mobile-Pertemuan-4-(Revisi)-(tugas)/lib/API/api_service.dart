import 'dart:convert';
import 'package:p4mobile/Model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _apiKey = 'af09afcfa3af435784537789c5ea8b2c';
  static const _baseUrl =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_apiKey';

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> articlesJson = jsonData['articles'];

        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception(
          'Gagal memuat berita (Status Code: ${response.statusCode})',
        );
      }
    } catch (e) {
      throw Exception('Gagal terhubung ke server: $e');
    }
  }
}
