import 'package:flutter/material.dart';
import 'package:praktikum_pab/models/dokter_model.dart';

class DokterProfileNavPage extends StatelessWidget {
  final DokterModel? dokter;

  const DokterProfileNavPage({super.key, required this.dokter});

  List<Widget> _buildRatingStars(double rating) {
    final List<Widget> stars = [];
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber));
    }
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber));
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(
        Icon(
          Icons.star_border,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      );
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    if (dokter == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Belum ada dokter yang dipilih.\nSilakan pilih kategori dokter terlebih dahulu.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    final selectedDokter = dokter!;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                selectedDokter.imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              selectedDokter.dokterName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              selectedDokter.dokterType,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),

            const SizedBox(height: 16),

            Text(
              'Jadwal Praktik',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              selectedDokter.praktikSchedule,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Biografi',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              selectedDokter.biography,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                ..._buildRatingStars(selectedDokter.rating),
                const SizedBox(width: 8),
                Text(
                  selectedDokter.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk booking dokter
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
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
                            child: const Text('Ya'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Buat Janji Temu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
