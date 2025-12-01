import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import 'gem_widget.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameState>(
      builder: (context, gameState, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final boardSize = screenWidth * 0.95;
        final cellSize = boardSize / GameState.gridSize;

        return Container(
          width: boardSize,
          height: boardSize,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 3,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: GameState.gridSize,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: GameState.gridSize * GameState.gridSize,
            itemBuilder: (context, index) {
              final row = index ~/ GameState.gridSize;
              final col = index % GameState.gridSize;
              final gem = gameState.grid[row][col];

              if (gem == null) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }

              return GestureDetector(
                onTap: () => gameState.selectGem(row, col),
                child: GemWidget(
                  gem: gem,
                  size: cellSize - 8,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
