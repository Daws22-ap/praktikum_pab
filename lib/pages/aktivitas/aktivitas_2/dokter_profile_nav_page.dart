import 'package:flutter/material.dart';
import 'package:praktikum_pab/models/dokter_model.dart';

class DokterProfileNavPage extends StatelessWidget {
  final DokterModel? dokter;

  const DokterProfileNavPage({super.key, required this.dokter});

  static const Color _primaryColor = Color(0xFF5B8DEF);
  static const Color _backgroundColor = Color(0xFFF6F9FF);
  static const Color _textColor = Color(0xFF1F2937);

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

  Widget _buildDoctorHeader(DokterModel dokter) {
    if (dokter.imagePath.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Image.asset(
          dokter.imagePath,
          width: double.infinity,
          height: 270,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF4F8FF), Color(0xFFE4EDFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: Icon(
          _specialistIcon(dokter.dokterType),
          size: 108,
          color: _primaryColor,
        ),
      ),
    );
  }

  List<Widget> _buildRatingStars(double rating) {
    final List<Widget> stars = [];
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star_rounded, color: Color(0xFFF4B400), size: 20));
    }
    if (hasHalfStar) {
      stars.add(
        const Icon(Icons.star_half_rounded, color: Color(0xFFF4B400), size: 20),
      );
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_outline_rounded, color: Color(0xFFD1D5DB), size: 20));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    if (dokter == null) {
      return Container(
        color: _backgroundColor,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: _primaryColor.withOpacity(0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Color(0xFFEEF4FF),
                  child: Icon(
                    Icons.medical_information_outlined,
                    size: 34,
                    color: _primaryColor,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'Belum Ada Dokter Dipilih',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: _textColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Pilih dokter dari tab kategori terlebih dahulu, lalu detail profil akan ditampilkan di sini.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final selectedDokter = dokter!;

    return Container(
      color: _backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _buildDoctorHeader(selectedDokter),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      selectedDokter.dokterType,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _primaryColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 18,
                          color: Color(0xFFF4B400),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          selectedDokter.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: _textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              selectedDokter.dokterName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Profil dokter ditampilkan dengan susunan sederhana: ringkasan, jadwal, biografi, lalu aksi utama.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: _primaryColor.withOpacity(0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFEEF4FF),
                    child: Icon(Icons.star_rounded, color: Color(0xFFF4B400)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rating Dokter',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 2,
                          children: _buildRatingStars(selectedDokter.rating),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    selectedDokter.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: _textColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _ProfileSectionCard(
              title: 'Jadwal Praktik',
              icon: Icons.schedule_outlined,
              child: Text(
                selectedDokter.praktikSchedule,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: _textColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _ProfileSectionCard(
              title: 'Biografi',
              icon: Icons.description_outlined,
              child: Text(
                selectedDokter.biography,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: _textColor,
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('Konfirmasi Janji Temu'),
                        content: Text(
                          'Apakah Anda ingin membuat janji temu dengan ${selectedDokter.dokterName}?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                            },
                            child: const Text('Batal'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Janji temu dengan ${selectedDokter.dokterName} berhasil dibuat!',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Ya'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                icon: const Icon(Icons.calendar_month_outlined),
                label: const Text(
                  'Buat Janji Temu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _ProfileSectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: DokterProfileNavPage._primaryColor.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFFEEF4FF),
                child: Icon(icon, color: DokterProfileNavPage._primaryColor, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: DokterProfileNavPage._textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
