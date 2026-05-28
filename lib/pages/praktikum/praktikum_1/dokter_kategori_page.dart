import 'package:flutter/material.dart';
import 'package:praktikum_pab/helpers/navigation_helper.dart';
import 'package:praktikum_pab/widgets/task_card.dart';
import '../praktikum_1/dokter_profile_page.dart';

class DokterKategoriPage extends StatelessWidget {
  const DokterKategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tugas Praktikum 1')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Halaman Penjadwalan Dokter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TaskCard(
                  title: 'Dokter Umum',
                  LeadingIcon: Icons.medical_services,
                  onTap: () {
                    goToPage(
                      context,
                      const DokterProfilePage(
                        dokterName: 'Dr. Andi Wijaya',
                        dokterType: 'Dokter Umum',
                        praktikSchedule: 'Senin - Jumat, 08.00 - 16.00',
                        biography:
                            'Dr. Andi Wijaya adalah seorang dokter umum dengan pengalaman lebih dari 10 tahun dalam memberikan pelayanan kesehatan kepada masyarakat.',
                        rating: 4.5,
                        imagePath: 'assets/images/dokter_umum.jpg',
                      ),
                    );
                  },
                ),
                TaskCard(
                  title: 'Dokter Gigi',
                  LeadingIcon: Icons.health_and_safety,
                  onTap: () {
                    goToPage(
                      context,
                      const DokterProfilePage(
                        dokterName: 'drg. Sinta Maharani',
                        dokterType: 'Dokter Gigi',
                        praktikSchedule: 'Selasa-sabtu, 09.00-16.00',
                        biography:
                            'Dokter gigi yang fokus pada pemeriksaan gigi, perawatan mulut, dan edukasi kesehatan gigi',
                        rating: 3.7,
                        imagePath: 'assets/images/dokter_gigi.jpg',
                      ),
                    );
                  },
                ),
                TaskCard(
                  title: 'Dokter Anak',
                  LeadingIcon: Icons.child_care,
                  onTap: () {
                    goToPage(
                      context,
                      const DokterProfilePage(
                        dokterName: 'Dr. Budi Setiawan',
                        dokterType: 'Dokter Anak',
                        praktikSchedule: 'Senin - Sabtu, 10.00 - 15.00',
                        biography:
                            'Dr. Budi Setiawan ahli dalam perawatan kesehatan anak dengan pendekatan hangat dan komunikatif untuk keluarga.',
                        rating: 4.8,
                        imagePath: 'assets/images/dokter_anak.jpg',
                      ),
                    );
                  },
                ),
                TaskCard(
                  title: 'Dokter Hewan',
                  LeadingIcon: Icons.pets,
                  onTap: () {
                    goToPage(
                      context,
                      const DokterProfilePage(
                        dokterName: 'drh. Lili Amalia',
                        dokterType: 'Dokter Hewan',
                        praktikSchedule: 'Rabu - Minggu, 09.00 - 14.00',
                        biography:
                            'drh. Lili Amalia berpengalaman dalam perawatan hewan peliharaan dan konsultasi kesehatan hewan.',
                        rating: 4.2,
                        imagePath: 'assets/images/dokter_hewan.jpg',
                      ),
                    );
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
