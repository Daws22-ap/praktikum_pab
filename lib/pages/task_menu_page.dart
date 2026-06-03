import 'package:flutter/material.dart';
import '../pages/welcome_page.dart';
import '../helpers/navigation_helper.dart';
import '../helpers/message_helper.dart';
import '../widgets/task_card.dart';
import '../pages/praktikum/praktikum_1/dokter_kategori_page.dart';
import '../pages/aktivitas/aktivitas_2/tugas_aktivitas_2_page.dart';
import '../pages/aktivitas/aktivitas_3/aktivitas_3_splash_page.dart';

class TaskMenuPage extends StatelessWidget {
  const TaskMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Tugas Praktikum PAB 2026'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pilih Tugas Praktikum',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TaskCard(
                  title: 'Tugas Aktivitas 1',
                  subtitle: 'Welcome Page',
                  onTap: () {
                    goToPage(context, const WelcomePage());
                  },
                ),
                TaskCard(
                  title: 'Aktivitas 2',
                  subtitle: 'Penjadwalan Dokter Versi Final',
                  onTap: () {
                    goToPage(context, const TugasAktivitas2Page());
                  },
                ),
                TaskCard(
                  title: 'Aktivitas 3',
                  subtitle: 'Isian Form Praktikum dan Splash Screen',
                  onTap: () {
                    goToPage(context, const Aktivitas3SplashPage());
                  },
                ),
                TaskCard(
                  title: 'Tugas Praktikum 1',
                  subtitle: 'Penjadwalan Dokter Versi Draft',
                  onTap: () {
                    goToPage(context, const DokterKategoriPage());
                  },
                ),
                TaskCard(
                  title: 'Praktikum 2',
                  subtitle: 'Navbar, file disamakan dengan Aktivitas 2',
                  onTap: () {
                    goToPage(context, const TugasAktivitas2Page());
                  },
                ),
                TaskCard(
                  title: 'Tugas Praktikum',
                  subtitle: 'Masih Kosong',
                  onTap: () {
                    tidakAdaPage(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
