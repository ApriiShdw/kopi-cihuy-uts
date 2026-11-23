import 'package:flutter/material.dart';

class RotatingCup extends StatefulWidget {
  const RotatingCup({super.key});

  @override
  State<RotatingCup> createState() => _RotatingCupState();
}

class _RotatingCupState extends State<RotatingCup>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        child: const Icon(
          Icons.coffee,
          color: Color(0xFFFFD180),
          size: 36,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * 3.141592653589793,
            child: child,
          );
        },
      ),
    );
  }
}