// Membuat blueprint makanan
class Makanan{
  String? nama;
  String? img;
  String? ranking;

  // Constructor
  Makanan({
    required this.nama,
    this.img,
    this.ranking
  });

  // Membuat pabrik untuk memasukan data
  factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      nama: json['strMeal'] as String,
      img: json['strMealThumb'] as String,
      ranking: json['idMeal'] as String,
    );
  }
}