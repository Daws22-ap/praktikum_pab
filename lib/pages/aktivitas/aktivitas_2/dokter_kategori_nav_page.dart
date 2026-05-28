import 'package:flutter/material.dart';
import 'package:praktikum_pab/models/dokter_model.dart';

class DokterKategoriNavPage extends StatelessWidget {
  final void Function(DokterModel dokter) onDokterSelected;

  const DokterKategoriNavPage({super.key, required this.onDokterSelected});

  static const Color _primaryColor = Color(0xFF5B8DEF);
  static const Color _backgroundColor = Color(0xFFF6F9FF);
  static const Color _textColor = Color(0xFF1F2937);

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
    DokterModel(
      dokterName: 'Dr. Reza Pratama, Sp.JP',
      dokterType: 'Dokter Jantung',
      praktikSchedule: 'Senin - Jumat, 13.00 - 18.00',
      biography:
          'Spesialis jantung yang berfokus pada pemeriksaan tekanan darah, gangguan irama jantung, dan pencegahan penyakit kardiovaskular.',
      rating: 4.7,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Nadia Aulia, Sp.KK',
      dokterType: 'Dokter Kulit',
      praktikSchedule: 'Selasa - Sabtu, 10.00 - 15.00',
      biography:
          'Melayani konsultasi masalah kulit, perawatan jerawat, alergi kulit, dan edukasi kesehatan kulit harian.',
      rating: 4.6,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Arman Saputra, Sp.S',
      dokterType: 'Dokter Saraf',
      praktikSchedule: 'Senin - Kamis, 09.00 - 13.00',
      biography:
          'Berpengalaman menangani keluhan sakit kepala, saraf terjepit, gangguan tidur, dan evaluasi neurologis umum.',
      rating: 4.5,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Citra Lestari, Sp.M',
      dokterType: 'Dokter Mata',
      praktikSchedule: 'Rabu - Minggu, 08.00 - 12.00',
      biography:
          'Fokus pada pemeriksaan kesehatan mata, keluhan penglihatan, mata kering, dan skrining dini gangguan mata.',
      rating: 4.8,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Yoga Firmansyah, Sp.THT',
      dokterType: 'Dokter THT',
      praktikSchedule: 'Senin - Jumat, 15.00 - 20.00',
      biography:
          'Menangani keluhan telinga, hidung, tenggorokan, sinusitis, dan infeksi saluran napas atas.',
      rating: 4.4,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Livia Maharani, Sp.B',
      dokterType: 'Dokter Bedah',
      praktikSchedule: 'Senin - Sabtu, 11.00 - 16.00',
      biography:
          'Dokter bedah dengan pengalaman pada tindakan bedah minor, konsultasi praoperasi, dan pemantauan pasca tindakan.',
      rating: 4.6,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Hana Putri, Sp.OG',
      dokterType: 'Dokter Kandungan',
      praktikSchedule: 'Selasa - Minggu, 09.00 - 14.00',
      biography:
          'Memberikan layanan kesehatan reproduksi wanita, pemeriksaan kehamilan, dan konsultasi siklus menstruasi.',
      rating: 4.9,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Fikri Ramadhan, Sp.P',
      dokterType: 'Dokter Paru',
      praktikSchedule: 'Senin - Jumat, 08.00 - 12.00',
      biography:
          'Menangani masalah paru dan pernapasan seperti batuk kronis, asma, dan edukasi berhenti merokok.',
      rating: 4.3,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Salma Khairunnisa, Sp.KJ',
      dokterType: 'Psikiater',
      praktikSchedule: 'Rabu - Minggu, 16.00 - 20.00',
      biography:
          'Menyediakan konsultasi kesehatan mental, stres, kecemasan, dan pendampingan terapi psikiatri.',
      rating: 4.8,
      imagePath: '',
    ),
    DokterModel(
      dokterName: 'Dr. Dimas Wicaksono, Sp.GK',
      dokterType: 'Dokter Gizi Klinik',
      praktikSchedule: 'Senin - Kamis, 10.00 - 14.00',
      biography:
          'Membantu perencanaan pola makan, pengelolaan berat badan, dan nutrisi pendukung pemulihan penyakit.',
      rating: 4.5,
      imagePath: '',
    ),
  ];

  IconData _specialistIcon(String dokterType) {
    if (dokterType.contains('Jantung')) return Icons.favorite_outline;
    if (dokterType.contains('Kulit')) return Icons.spa_outlined;
    if (dokterType.contains('Saraf')) return Icons.psychology_outlined;
    if (dokterType.contains('Mata')) return Icons.visibility_outlined;
    if (dokterType.contains('THT')) return Icons.hearing_outlined;
    if (dokterType.contains('Bedah')) return Icons.medical_services_outlined;
    if (dokterType.contains('Kandungan')) return Icons.pregnant_woman_outlined;
    if (dokterType.contains('Paru')) return Icons.air_outlined;
    if (dokterType.contains('Psikiater')) return Icons.self_improvement_outlined;
    if (dokterType.contains('Gizi')) return Icons.restaurant_menu_outlined;
    if (dokterType.contains('Gigi')) return Icons.sentiment_satisfied_alt_outlined;
    if (dokterType.contains('Anak')) return Icons.child_friendly_outlined;
    if (dokterType.contains('Hewan')) return Icons.pets_outlined;
    return Icons.local_hospital_outlined;
  }

  Widget _buildDoctorThumbnail(DokterModel dokter) {
    if (dokter.imagePath.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          dokter.imagePath,
          width: double.infinity,
          height: 132,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      height: 132,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF4F8FF), Color(0xFFE4EDFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          _specialistIcon(dokter.dokterType),
          size: 54,
          color: _primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEDF4FF), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      'Kategori Dokter',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Pilih Dokter Sesuai Kebutuhan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: _textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tampilan ini dibuat simpel: pilih kartu dokter untuk melihat profil, jadwal, dan informasi singkatnya.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const _InfoChip(
                        icon: Icons.groups_2_outlined,
                        label: '14 dokter',
                      ),
                      const SizedBox(width: 10),
                      const _InfoChip(
                        icon: Icons.touch_app_outlined,
                        label: 'Tap untuk detail',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: dokterList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final dokter = dokterList[index];

                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => onDokterSelected(dokter),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF5B8DEF).withOpacity(0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDoctorThumbnail(dokter),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEF4FF),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  dokter.dokterType,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: _primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                dokter.dokterName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.3,
                                  fontWeight: FontWeight.w700,
                                  color: _textColor,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 18,
                                    color: Color(0xFFF4B400),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    dokter.rating.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: _textColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18,
                                    color: _primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 2),
          Icon(icon, size: 16, color: DokterKategoriNavPage._primaryColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: DokterKategoriNavPage._textColor,
            ),
          ),
          const SizedBox(width: 2),
        ],
      ),
    );
  }
}
