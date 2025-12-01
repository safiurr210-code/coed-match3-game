import 'package:flutter/material.dart';

enum GemType {
  ruby,      // Red
  sapphire,  // Blue
  emerald,   // Green
  topaz,     // Yellow
  amethyst,  // Purple
  citrine,   // Orange
}

class Gem {
  final GemType type;
  final int row;
  final int col;
  bool isMatched;
  bool isSelected;
  bool isFalling;

  Gem({
    required this.type,
    required this.row,
    required this.col,
    this.isMatched = false,
    this.isSelected = false,
    this.isFalling = false,
  });

  Color get color {
    switch (type) {
      case GemType.ruby:
        return Colors.red;
      case GemType.sapphire:
        return Colors.blue;
      case GemType.emerald:
        return Colors.green;
      case GemType.topaz:
        return Colors.yellow;
      case GemType.amethyst:
        return Colors.purple;
      case GemType.citrine:
        return Colors.orange;
    }
  }

  String get emoji {
    switch (type) {
      case GemType.ruby:
        return '💎';
      case GemType.sapphire:
        return '💠';
      case GemType.emerald:
        return '💚';
      case GemType.topaz:
        return '⭐';
      case GemType.amethyst:
        return '🔮';
      case GemType.citrine:
        return '🧡';
    }
  }

  Gem copyWith({
    GemType? type,
    int? row,
    int? col,
    bool? isMatched,
    bool? isSelected,
    bool? isFalling,
  }) {
    return Gem(
      type: type ?? this.type,
      row: row ?? this.row,
      col: col ?? this.col,
      isMatched: isMatched ?? this.isMatched,
      isSelected: isSelected ?? this.isSelected,
      isFalling: isFalling ?? this.isFalling,
    );
  }
}
