import 'package:flutter/material.dart';

void tidakAdaPage(BuildContext context) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('Halaman belum tersedia')));
}
