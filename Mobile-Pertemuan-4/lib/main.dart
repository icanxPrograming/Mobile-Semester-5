import 'package:flutter/material.dart';
import 'package:mobile_p4/API/MakananAPI.dart';
import 'package:mobile_p4/Model/makanan_model.dart';

void main() {
  runApp(DaftarMakanan());
}

class DaftarMakanan extends StatelessWidget {
  const DaftarMakanan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TampilanDaftarMakanan());
  }
}

class TampilanDaftarMakanan extends StatefulWidget {
  const TampilanDaftarMakanan({super.key});

  @override
  State<TampilanDaftarMakanan> createState() => _TampilanDaftarMakananState();
}

class _TampilanDaftarMakananState extends State<TampilanDaftarMakanan> {
  late Future<List<Makanan>> _makanan;
  final ScrollController _scrollController = ScrollController();
  bool _showScrollTopButton = false;

  @override
  void initState() {
    super.initState();
    _makanan = ApiService().fecthMakanan();
    _scrollController.addListener(() {
      setState(() {
        _showScrollTopButton = _scrollController.position.pixels > 100;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() {
      _makanan = ApiService().fecthMakanan();
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Makanan"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("List Menu Makanan"),
            Expanded(
              child: FutureBuilder<List<Makanan>>(
                future: _makanan,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final makanans = snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: _refreshData,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: makanans.length,
                        itemBuilder: (context, index) {
                          final makanan = makanans[index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: Image.network(
                                makanan.img!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              title: Text(makanan.nama!),
                              subtitle: Text("ID: ${makanan.ranking!}"),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text("Tidak ada data.");
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _showScrollTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.amber,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
