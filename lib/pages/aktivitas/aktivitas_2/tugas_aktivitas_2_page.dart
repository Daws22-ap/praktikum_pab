import 'package:flutter/material.dart';
import 'package:praktikum_pab/models/dokter_model.dart';
import 'package:praktikum_pab/pages/aktivitas/aktivitas_2/dokter_kategori_nav_page.dart';
import 'package:praktikum_pab/pages/aktivitas/aktivitas_2/dokter_profile_nav_page.dart';

class TugasAktivitas2Page extends StatefulWidget {
  const TugasAktivitas2Page({super.key});

  @override
  State<TugasAktivitas2Page> createState() => _TugasAktivitas2PageState();
}

class _TugasAktivitas2PageState extends State<TugasAktivitas2Page> {
  int _selectedIndex = 0;
  DokterModel? _selectedDokter;

  void _onDokterSelected(DokterModel dokter) {
    setState(() {
      _selectedDokter = dokter;
      _selectedIndex = 1; // Pindah ke halaman profil dokter
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      DokterKategoriNavPage(onDokterSelected: _onDokterSelected),
      DokterProfileNavPage(dokter: _selectedDokter),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text(' Aktivitas 2'), centerTitle: true),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Kategori Dokter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil Dokter',
          ),
        ],
      ),
    );
  }
}
