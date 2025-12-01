import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade900,
              Colors.blue.shade900,
              Colors.pink.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Game Title
                Text(
                  'COED',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Match-3 Puzzle',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 60),
                
                // High Score
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'HIGH SCORE',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${gameState.highScore}',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                
                // Play Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.purple.shade900,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    'PLAY',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // How to Play
                TextButton(
                  onPressed: () {
                    _showHowToPlay(context);
                  },
                  child: Text(
                    'How to Play',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showHowToPlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.purple.shade900,
        title: const Text(
          'How to Play',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          '1. Swap adjacent gems to create matches\n\n'
          '2. Match 3 or more gems of the same color\n\n'
          '3. Create combos for bonus points\n\n'
          '4. Beat the clock and get the highest score!',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'GOT IT!',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }
}
