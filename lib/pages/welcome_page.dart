import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../constants/app_data.dart';
import '../constants/app_colors.dart';
import 'task_menu_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppData.appName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(AppData.welcomeTitle, style: TextStyle(fontSize: 18)),
              const Text(
                AppData.welcomeSubtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryVariant,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                AppData.studentId,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              Image.asset(
                AppData.welcomeImage,
                width: 220,
                fit: BoxFit.contain,
              ),
              const Text(
                AppData.studentName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    replaceWithPage(context, const TaskMenuPage());
                  },
                  child: const Text(AppData.enterButtonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
