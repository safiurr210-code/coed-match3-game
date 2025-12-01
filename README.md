# Coed - Match-3 Puzzle Game

A colorful endless Match-3 puzzle game for iOS and Android with score-based and time-based challenges.

## Features
- 🎮 Classic Match-3 gameplay
- ⏱️ Time-based challenges
- 🏆 Score tracking with combos
- 🎨 Colorful graphics and animations
- 📱 Cross-platform (iOS & Android)
- 💰 Free with ads

## Tech Stack
- Flutter 3.x
- Dart
- Firebase (optional for leaderboards)
- AdMob for monetization

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0 or higher)
- Android Studio / Xcode
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/safiurr210-code/coed-match3-game.git
cd coed-match3-game
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure
```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── home_screen.dart      # Main menu
│   ├── game_screen.dart      # Game play
│   └── game_over_screen.dart # Game over
├── models/
│   ├── gem.dart              # Gem model
│   └── game_state.dart       # Game state management
├── widgets/
│   ├── game_board.dart       # Match-3 grid
│   ├── gem_widget.dart       # Individual gem
│   └── score_display.dart    # Score UI
└── utils/
    ├── game_logic.dart       # Match detection
    └── constants.dart        # Game constants
```

## Game Assets
All game assets are located in `assets/` directory:
- Gem tiles
- Backgrounds
- UI elements
- Sound effects (to be added)

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Ad Integration
AdMob integration is set up. Add your Ad Unit IDs in:
- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/Info.plist`

## Contributing
Pull requests are welcome!

## License
MIT License

## Developer
Created by Safiur Rahaman (Maruf)
