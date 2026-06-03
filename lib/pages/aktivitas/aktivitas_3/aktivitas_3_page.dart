import 'package:flutter/material.dart';
import 'package:praktikum_pab/helpers/navigation_helper.dart';
import 'package:praktikum_pab/models/peserta_data.dart';
import 'package:praktikum_pab/pages/welcome_page.dart';

class Aktivitas3Page extends StatefulWidget {
  const Aktivitas3Page({super.key});

  @override
  State<Aktivitas3Page> createState() => _Aktivitas3PageState();
}

class _Aktivitas3PageState extends State<Aktivitas3Page> {
  static const Color _pageBackgroundColor = Color(0xFFF5F6F2);
  static const Color _buttonColor = Color(0xFFA7BC9A);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nbiController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nbiController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _instagramController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final pesertaData = PesertaData(
      nama: _namaController.text.trim(),
      nbi: _nbiController.text.trim(),
      email: _emailController.text.trim(),
      alamat: _alamatController.text.trim(),
      instagram: _instagramController.text.trim(),
    );

    PesertaDataStore.current = pesertaData;
    replaceWithPage(context, WelcomePage(pesertaData: pesertaData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/images/gambar_aktivitas_3.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'WELCOME',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Praktikum PAB 2026',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 32),
                  _buildInputField(
                    controller: _namaController,
                    hintText: 'Masukan Nama',
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: _nbiController,
                    hintText: 'Masukan NBI',
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: _emailController,
                    hintText: 'Masukan Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: _alamatController,
                    hintText: 'Masukan Alamat',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: _instagramController,
                    hintText: 'Masukan Akun Instagram',
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _buttonColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$hintText tidak boleh kosong';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
