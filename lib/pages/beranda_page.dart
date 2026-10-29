import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/favorit_provider.dart';
import '../cubits/keranjang_cubit.dart';
import 'catalog_page.dart';
import 'form_page.dart';
import 'map_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenShop - Beranda'),
        actions: [
          // Menampilkan jumlah Favorit menggunakan Consumer (Provider)[cite: 4]
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Consumer<FavoritProvider>(
                builder: (context, favProvider, child) {
                  return Text('Fav: ${favProvider.jumlahFavorit}');
                },
              ),
            ),
          ),
          // Menampilkan jumlah barang Keranjang menggunakan BlocBuilder (Cubit)[cite: 4]
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<KeranjangCubit, int>(
                builder: (context, count) {
                  return Text('Cart: $count');
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang di GreenShop',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Komunitas GreenLife Bandung memproduksi berbagai barang ramah lingkungan, seperti botol minum, tas belanja kain, dan sedotan stainless.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Perpindahan ke Katalog menggunakan Navigator.push[cite: 1]
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CatalogPage()),
                );
              },
              child: const Text('Lihat Katalog'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
              child: const Text('Form Pemesanan'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
              child: const Text('Lokasi Komunitas (Google Maps)'),
            ),
          ],
        ),
      ),
    );
  }
}
