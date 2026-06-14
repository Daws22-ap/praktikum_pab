import 'package:flutter/material.dart';
import 'package:praktikum_pab/pages/aktivitas/aktivitas_4/aktivitas_4_pin.dart';

class Aktivitas3SplashPage extends StatefulWidget {
  const Aktivitas3SplashPage({super.key});

  @override
  State<Aktivitas3SplashPage> createState() => _Aktivitas3SplashPageState();
}

class _Aktivitas3SplashPageState extends State<Aktivitas3SplashPage> {
  static const Color _backgroundColor = Color(0xFFCACAFF);

  @override
  void initState() {
    super.initState();
    _goToAktivitas3Page();
  }

  Future<void> _goToAktivitas3Page() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Aktivitas4Pin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Image(
              image: AssetImage('assets/images/gambar_praktikum_3.jpeg'),
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
