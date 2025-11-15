import 'package:flutter/material.dart';
import 'package:mobile_p6/widgets/gridview.dart';
import 'package:mobile_p6/widgets/listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Katalog Produk'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'ListView'),
              Tab(icon: Icon(Icons.grid_on), text: 'GridView'),
            ],
          ),
        ),
        body: TabBarView(
          children: [buildListView(context), buildGridView(context)],
        ),
      ),
    );
  }
}
