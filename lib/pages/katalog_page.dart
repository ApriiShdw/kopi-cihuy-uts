import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../data/menu_data.dart';
import '../animations/rotating_cup.dart';
import '../widgets/menu_card.dart';
import 'detail_page.dart';

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  void _bukaDetail(BuildContext context, MenuModel menu) {
    Navigator.push(
      context,
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailPage(menu: menu);
        },
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1E2),
      appBar: AppBar(
        toolbarHeight: 78,
        backgroundColor: const Color(0xFF4E2614),
        title: Row(
          children: [
            const RotatingCup(),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kopi Cihuy',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Teman terbaik setiap hari',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFFC078),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 190,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: const DecorationImage(
                image: AssetImage('assets/images/kopi_banner.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF301508).withValues(alpha: 0.85),
                    Colors.transparent,
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nikmati kopi favoritmu\n di Kopi Cihuy.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Menu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E2614),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];

                return MenuCard(
                  key: ValueKey(menu.id),
                  menu: menu,
                  onTap: () => _bukaDetail(context, menu),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 12,
              top: 4,
            ),
            child: Text(
              'Kopi Cihuy - Dibuat dengan sepenuh hati',
              style: TextStyle(
                color: Color(0xFF795548),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}