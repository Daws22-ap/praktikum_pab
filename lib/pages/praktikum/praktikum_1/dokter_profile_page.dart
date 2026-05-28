import 'package:flutter/material.dart';

class DokterProfilePage extends StatelessWidget {
  final String dokterName;
  final String dokterType;
  final String praktikSchedule;
  final String biography;
  final double rating;
  final String imagePath;

  const DokterProfilePage({
    super.key,
    required this.dokterName,
    required this.dokterType,
    required this.praktikSchedule,
    required this.biography,
    required this.rating,
    required this.imagePath,
  });

  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(
        const Icon(Icons.star, color: Color.fromARGB(255, 241, 209, 3)),
      );
    }
    if (hasHalfStar) {
      stars.add(
        const Icon(Icons.star_half, color: Color.fromARGB(255, 241, 209, 3)),
      );
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, color: Colors.grey.shade400));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dokterType)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                dokterName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text('Jadwal Praktik:', style: TextStyle(fontSize: 16)),
              Text(praktikSchedule, style: const TextStyle(fontSize: 13)),

              const SizedBox(height: 20),

              const Text(
                'Biografi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(biography, style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 25),
              Row(
                children: [
                  ..._buildRatingStars(rating),
                  const SizedBox(width: 5),
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi Janji Temu'),
                          content: Text(
                            'Apakah Anda ingin membuat janji temu dengan $dokterName?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Batal'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Janji temu dengan $dokterName berhasil dibuat!',
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
                  child: const Text('Buat Janji Temu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
