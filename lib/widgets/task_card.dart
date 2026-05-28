import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final IconData? LeadingIcon;

  const TaskCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.LeadingIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: LeadingIcon == null ? null : Icon(LeadingIcon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryVariant,
                ),
              ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
