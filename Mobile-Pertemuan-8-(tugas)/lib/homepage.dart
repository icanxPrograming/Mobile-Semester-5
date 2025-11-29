import 'package:flutter/material.dart';
import 'package:mobile_p8/themeprovider.dart';
import 'package:mobile_p8/userprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final TextEditingController nameController = TextEditingController(
      text: userProvider.username,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userProvider.username.isEmpty
              ? 'Pengaturan Tema & User'
              : 'Halo, ${userProvider.username}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input nama pengguna
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                userProvider.saveUsername(nameController.text);
              },
              child: const Text('Simpan Nama'),
            ),

            const SizedBox(height: 20),

            Text(
              'Nama tersimpan: ${userProvider.username}',
              style: TextStyle(fontSize: 16),
            ),

            const Divider(height: 40),

            // Tema switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
