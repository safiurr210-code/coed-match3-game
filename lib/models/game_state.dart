import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:math';
import 'gem.dart';

class GameState extends ChangeNotifier {
  static const int gridSize = 8;
  static const int initialTime = 60;
  
  List<List<Gem?>> grid = [];
  int score = 0;
  int highScore = 0;
  int timeRemaining = initialTime;
  int combo = 0;
  bool isPlaying = false;
  Timer? gameTimer;
  
  Gem? selectedGem;
  final Random random = Random();

  GameState() {
    _initializeGrid();
  }

  void _initializeGrid() {
    grid = List.generate(
      gridSize,
      (row) => List.generate(
        gridSize,
        (col) => _createRandomGem(row, col),
      ),
    );
    
    // Ensure no initial matches
    while (_hasMatches()) {
      _shuffleMatches();
    }
  }

  Gem _createRandomGem(int row, int col) {
    final types = GemType.values;
    return Gem(
      type: types[random.nextInt(types.length)],
      row: row,
      col: col,
    );
  }

  void startGame() {
    score = 0;
    timeRemaining = initialTime;
    combo = 0;
    isPlaying = true;
    _initializeGrid();
    
    gameTimer?.cancel();
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining > 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        endGame();
      }
    });
    
    notifyListeners();
  }

  void endGame() {
    isPlaying = false;
    gameTimer?.cancel();
    
    if (score > highScore) {
      highScore = score;
    }
    
    notifyListeners();
  }

  void selectGem(int row, int col) {
    if (!isPlaying) return;
    
    final gem = grid[row][col];
    if (gem == null) return;

    if (selectedGem == null) {
      selectedGem = gem;
      gem.isSelected = true;
      notifyListeners();
    } else {
      if (_areAdjacent(selectedGem!, gem)) {
        _swapGems(selectedGem!, gem);
        selectedGem!.isSelected = false;
        selectedGem = null;
      } else {
        selectedGem!.isSelected = false;
        selectedGem = gem;
        gem.isSelected = true;
      }
      notifyListeners();
    }
  }

  bool _areAdjacent(Gem gem1, Gem gem2) {
    final rowDiff = (gem1.row - gem2.row).abs();
    final colDiff = (gem1.col - gem2.col).abs();
    return (rowDiff == 1 && colDiff == 0) || (rowDiff == 0 && colDiff == 1);
  }

  void _swapGems(Gem gem1, Gem gem2) {
    final tempType = gem1.type;
    grid[gem1.row][gem1.col] = gem1.copyWith(type: gem2.type);
    grid[gem2.row][gem2.col] = gem2.copyWith(type: tempType);

    if (_hasMatches()) {
      _processMatches();
    } else {
      // Swap back if no matches
      grid[gem1.row][gem1.col] = gem1;
      grid[gem2.row][gem2.col] = gem2;
    }
  }

  bool _hasMatches() {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (_checkMatch(row, col)) return true;
      }
    }
    return false;
  }

  bool _checkMatch(int row, int col) {
    final gem = grid[row][col];
    if (gem == null) return false;

    // Check horizontal
    int horizontalCount = 1;
    for (int i = col + 1; i < gridSize && grid[row][i]?.type == gem.type; i++) {
      horizontalCount++;
    }
    for (int i = col - 1; i >= 0 && grid[row][i]?.type == gem.type; i--) {
      horizontalCount++;
    }

    // Check vertical
    int verticalCount = 1;
    for (int i = row + 1; i < gridSize && grid[i][col]?.type == gem.type; i++) {
      verticalCount++;
    }
    for (int i = row - 1; i >= 0 && grid[i][col]?.type == gem.type; i--) {
      verticalCount++;
    }

    return horizontalCount >= 3 || verticalCount >= 3;
  }

  void _processMatches() {
    int matchedGems = 0;
    
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (_checkMatch(row, col)) {
          grid[row][col]?.isMatched = true;
          matchedGems++;
        }
      }
    }

    if (matchedGems > 0) {
      combo++;
      score += matchedGems * 10 * combo;
      _removeMatched();
      _applyGravity();
      _fillEmpty();
      
      // Check for cascading matches
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_hasMatches()) {
          _processMatches();
        } else {
          combo = 0;
        }
      });
    }
    
    notifyListeners();
  }

  void _removeMatched() {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (grid[row][col]?.isMatched == true) {
          grid[row][col] = null;
        }
      }
    }
  }

  void _applyGravity() {
    for (int col = 0; col < gridSize; col++) {
      for (int row = gridSize - 1; row >= 0; row--) {
        if (grid[row][col] == null) {
          for (int above = row - 1; above >= 0; above--) {
            if (grid[above][col] != null) {
              grid[row][col] = grid[above][col]!.copyWith(row: row);
              grid[above][col] = null;
              break;
            }
          }
        }
      }
    }
  }

  void _fillEmpty() {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (grid[row][col] == null) {
          grid[row][col] = _createRandomGem(row, col);
        }
      }
    }
  }

  void _shuffleMatches() {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (_checkMatch(row, col)) {
          grid[row][col] = _createRandomGem(row, col);
        }
      }
    }
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
}
