import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class Praktikum4DogPage extends StatefulWidget {
  const Praktikum4DogPage({super.key});

  @override
  State<Praktikum4DogPage> createState() => _Praktikum4DogPageState();
}

class _Praktikum4DogPageState extends State<Praktikum4DogPage> {
  static const String _apiUrl = 'https://dog.ceo/api/breeds/image/random/20';

  late Future<List<String>> _dogImagesFuture;

  @override
  void initState() {
    super.initState();
    _dogImagesFuture = _fetchDogImages();
  }

  Future<List<String>> _fetchDogImages() async {
    final HttpClient client = HttpClient();

    try {
      final HttpClientRequest request = await client.getUrl(Uri.parse(_apiUrl));
      final HttpClientResponse response = await request.close();
      final String responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode != HttpStatus.ok) {
        throw Exception(
          'Gagal memuat data. Status code: ${response.statusCode}',
        );
      }

      final Map<String, dynamic> json =
          jsonDecode(responseBody) as Map<String, dynamic>;
      final String status = json['status'] as String? ?? 'error';
      final List<dynamic> message =
          json['message'] as List<dynamic>? ?? <dynamic>[];

      if (status != 'success' || message.isEmpty) {
        throw Exception('Response API tidak valid.');
      }

      return message.map((dynamic item) => item.toString()).toList();
    } finally {
      client.close(force: true);
    }
  }

  Future<void> _refreshImages() async {
    final Future<List<String>> refreshedFuture = _fetchDogImages();

    setState(() {
      _dogImagesFuture = refreshedFuture;
    });

    await refreshedFuture;
  }

  String _extractBreedName(String imageUrl) {
    final Uri uri = Uri.parse(imageUrl);
    final List<String> segments = uri.pathSegments;

    if (segments.length < 2) {
      return 'Unknown breed';
    }

    final String breedSegment = segments[1].replaceAll('-', ' ');
    return breedSegment
        .split(' ')
        .where((String part) => part.isNotEmpty)
        .map(
          (String part) =>
              '${part[0].toUpperCase()}${part.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum 4 - Dog API')),
      body: FutureBuilder<List<String>>(
        future: _dogImagesFuture,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.pets, size: 56),
                    const SizedBox(height: 16),
                    Text(
                      'Gagal mengambil data anjing dari API.',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text('${snapshot.error}', textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: _refreshImages,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          final List<String> dogImages = snapshot.data ?? <String>[];

          return RefreshIndicator(
            onRefresh: _refreshImages,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
              itemCount: dogImages.length,
              itemBuilder: (BuildContext context, int index) {
                final String imageUrl = dogImages[index];

                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder:
                              (
                                BuildContext context,
                                Widget child,
                                ImageChunkEvent? loadingProgress,
                              ) {
                                if (loadingProgress == null) {
                                  return child;
                                }

                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                          errorBuilder:
                              (
                                BuildContext context,
                                Object error,
                                StackTrace? stackTrace,
                              ) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Icon(Icons.broken_image, size: 40),
                                  ),
                                );
                              },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                        child: Text(
                          _extractBreedName(imageUrl),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshImages,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
