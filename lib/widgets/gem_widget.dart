import 'package:flutter/material.dart';
import '../models/gem.dart';

class GemWidget extends StatelessWidget {
  final Gem gem;
  final double size;

  const GemWidget({
    super.key,
    required this.gem,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: gem.isSelected
            ? Colors.white.withOpacity(0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: gem.isSelected
            ? Border.all(color: Colors.white, width: 3)
            : null,
      ),
      child: AnimatedScale(
        scale: gem.isMatched ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                gem.color.withOpacity(0.8),
                gem.color,
                gem.color.withOpacity(0.6),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: gem.color.withOpacity(0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              gem.emoji,
              style: TextStyle(
                fontSize: size * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
