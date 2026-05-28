import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF6AA8FF);
    const softAccent = Color(0xFFE8EEFF);

    final profileItems = [
      const _ProfileItem(
        icon: Icons.person_outline_rounded,
        value: 'Mohammad Firdausi Hadi Pramono',
      ),
      const _ProfileItem(icon: Icons.call_outlined, value: '1462300239'),
      const _ProfileItem(
        icon: Icons.email_outlined,
        value: 'pab2023@gmail.com',
      ),
      const _ProfileItem(icon: Icons.location_on_outlined, value: 'Mojokerto'),
      const _ProfileItem(icon: Icons.camera_alt_outlined, value: 'pab2026'),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: softAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(160),
                          bottomRight: Radius.circular(160),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 34),
                        child: Text(
                          'Profil Pengguna',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 102,
                      child: Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/student.png',
                            width: 112,
                            height: 112,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 78),
                for (int i = 0; i < profileItems.length; i++) ...[
                  _ProfileInfoRow(
                    item: profileItems[i],
                    accentColor: accentColor,
                  ),
                  if (i != profileItems.length - 1)
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFD8D8D8),
                    ),
                ],
                const SizedBox(height: 48),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: _BottomAccent(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProfileItem {
  final IconData icon;
  final String value;

  const _ProfileItem({required this.icon, required this.value});
}

class _ProfileInfoRow extends StatelessWidget {
  final _ProfileItem item;
  final Color accentColor;

  const _ProfileInfoRow({required this.item, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      child: Row(
        children: [
          Icon(item.icon, color: accentColor, size: 32),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              item.value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D2D2D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomAccent extends StatelessWidget {
  const _BottomAccent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8EEFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(180),
          topRight: Radius.circular(180),
        ),
      ),
    );
  }
}
