import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class RadialHero extends StatelessWidget {
  final MenuModel menu;
  final double ukuran;
  final bool detail;

  const RadialHero({
    super.key,
    required this.menu,
    required this.ukuran,
    this.detail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-${menu.id}',
      createRectTween: (begin, end) {
        return MaterialRectArcTween(
          begin: begin,
          end: end,
        );
      },
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        final bool maju =
            flightDirection == HeroFlightDirection.push;

        final radiusTween = BorderRadiusTween(
          begin: BorderRadius.circular(maju ? 50 : 12),
          end: BorderRadius.circular(maju ? 12 : 50),
        );

        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
        );

        return AnimatedBuilder(
          animation: curvedAnimation,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: radiusTween.evaluate(curvedAnimation) ??
                  BorderRadius.zero,
              child: child,
            );
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: ukuran,
              height: ukuran,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFD7A86E),
                    Color(0xFF795548),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(
                menu.ikon,
                size: ukuran * 0.48,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(detail ? 12 : 50),
        child: Container(
          width: ukuran,
          height: ukuran,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFD7A86E),
                Color(0xFF795548),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            menu.ikon,
            size: ukuran * 0.48,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}