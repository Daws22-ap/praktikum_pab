import 'package:flutter/material.dart';
import 'package:praktikum_pab/pages/aktivitas/aktivitas_2/tugas_aktivitas_2_page.dart';

import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../helpers/navigation_helper.dart';
import '../models/peserta_data.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, this.pesertaData});

  final PesertaData? pesertaData;

  @override
  Widget build(BuildContext context) {
    final currentPesertaData = pesertaData ?? PesertaDataStore.current;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppData.appName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  AppData.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const Text(
                  AppData.welcomeSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryVariant,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  currentPesertaData?.nbi ?? AppData.studentId,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Image.asset(
                  AppData.welcomeImage,
                  width: 220,
                  fit: BoxFit.contain,
                ),
                Text(
                  currentPesertaData?.nama ?? AppData.studentName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryVariant,
                      foregroundColor: AppColors.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: () {
                      replaceWithPage(context, const TugasAktivitas2Page());
                    },
                    child: const Text(AppData.enterButtonText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
