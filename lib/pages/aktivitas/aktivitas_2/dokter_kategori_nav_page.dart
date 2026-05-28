import 'package:flutter/material.dart';
import 'package:praktikum_pab/models/dokter_model.dart';

class DokterKategoriNavPage extends StatelessWidget {
  final void Function(DokterModel dokter) onDokterSelected;

  const DokterKategoriNavPage({super.key, required this.onDokterSelected});

  static const List<DokterModel> dokterList = [
    DokterModel(
      dokterName: 'Dr. Andi Wijaya',
      dokterType: 'Dokter Umum',
      praktikSchedule: 'Senin - Jumat, 08.00 - 16.00',
      biography:
          'Dr. Andi Wijaya adalah seorang dokter umum dengan pengalaman lebih dari 10 tahun dalam memberikan pelayanan kesehatan kepada masyarakat.',
      rating: 4.5,
      imagePath: 'assets/images/dokter_umum.jpg',
    ),
    DokterModel(
      dokterName: 'drg. Sinta Maharani',
      dokterType: 'Dokter Gigi',
      praktikSchedule: 'Selasa - Sabtu, 09.00 - 16.00',
      biography:
          'Dokter gigi yang fokus pada pemeriksaan gigi, perawatan mulut, dan edukasi kesehatan gigi.',
      rating: 3.7,
      imagePath: 'assets/images/dokter_gigi.jpg',
    ),
    DokterModel(
      dokterName: 'Dr. Budi Setiawan',
      dokterType: 'Dokter Anak',
      praktikSchedule: 'Senin - Sabtu, 10.00 - 15.00',
      biography:
          'Dr. Budi Setiawan ahli dalam perawatan kesehatan anak dengan pendekatan hangat dan komunikatif untuk keluarga.',
      rating: 4.8,
      imagePath: 'assets/images/dokter_anak.jpg',
    ),
    DokterModel(
      dokterName: 'drh. Lili Amalia',
      dokterType: 'Dokter Hewan',
      praktikSchedule: 'Rabu - Minggu, 09.00 - 14.00',
      biography:
          'drh. Lili Amalia berpengalaman dalam perawatan hewan peliharaan dan konsultasi kesehatan hewan.',
      rating: 4.2,
      imagePath: 'assets/images/dokter_hewan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      child: Column(
        children: [
          const Text(
            'Pilih Kategori Dokter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 28),

          Expanded(
            child: GridView.builder(
              itemCount: dokterList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 24,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                final dokter = dokterList[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    onDokterSelected(dokter);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(
                              dokter.imagePath,
                              width: 150,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            dokter.dokterType,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF111827),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            dokter.dokterName,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.25,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
