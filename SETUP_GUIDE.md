# Coed Match-3 Game - Complete Setup Guide

## 🎮 Game Overview
Coed is a colorful endless Match-3 puzzle game with:
- ✅ Complete Match-3 mechanics (swap, match, cascade)
- ✅ Score system with combo multipliers
- ✅ 60-second timer challenges
- ✅ High score tracking
- ✅ Smooth animations
- ✅ AdMob integration ready
- ✅ Cross-platform (iOS & Android)

## 📋 Prerequisites

### Required Software
1. **Flutter SDK** (3.0+)
   - Download: https://flutter.dev/docs/get-started/install
   - Verify: `flutter doctor`

2. **Android Studio** (for Android)
   - Download: https://developer.android.com/studio
   - Install Android SDK and emulator

3. **Xcode** (for iOS - Mac only)
   - Download from Mac App Store
   - Install Command Line Tools

4. **Git**
   - Download: https://git-scm.com/downloads

## 🚀 Quick Start

### Step 1: Clone Repository
```bash
git clone https://github.com/safiurr210-code/coed-match3-game.git
cd coed-match3-game
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Run the Game
```bash
# For Android
flutter run

# For iOS (Mac only)
flutter run -d ios

# For specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

## 📱 Testing on Real Devices

### Android
1. Enable Developer Options on your phone
2. Enable USB Debugging
3. Connect via USB
4. Run: `flutter run`

### iOS
1. Connect iPhone via USB
2. Trust computer on iPhone
3. Open Xcode and add Apple ID
4. Run: `flutter run -d ios`

## 🎨 Adding Your Game Assets

The game currently uses emoji placeholders. To add your custom assets:

### 1. Create Assets Folder
```bash
mkdir -p assets/images
```

### 2. Add Your Images
Download the generated assets and place them in `assets/images/`:
- `gem_ruby.png`
- `gem_sapphire.png`
- `gem_emerald.png`
- `gem_topaz.png`
- `gem_amethyst.png`
- `gem_citrine.png`
- `background.jpg`

### 3. Update Gem Widget
Edit `lib/widgets/gem_widget.dart` to use images instead of emojis:

```dart
child: Image.asset(
  'assets/images/gem_${gem.type.name}.png',
  width: size * 0.7,
  height: size * 0.7,
),
```

## 💰 AdMob Integration

### Step 1: Create AdMob Account
1. Go to https://admob.google.com
2. Create account and add your app
3. Get your App ID and Ad Unit IDs

### Step 2: Update App IDs

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="YOUR_ANDROID_APP_ID"/>
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>GADApplicationIdentifier</key>
<string>YOUR_IOS_APP_ID</string>
```

### Step 3: Add Banner Ads
Create `lib/widgets/ad_banner.dart`:

```dart
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AdBanner extends StatefulWidget {
  @override
  _AdBannerState createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: 'YOUR_AD_UNIT_ID', // Replace with your Ad Unit ID
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd != null) {
      return Container(
        height: 50,
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return SizedBox.shrink();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
```

Add to game over screen for monetization.

## 🏗️ Building for Production

### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS
```bash
flutter build ios --release
```
Then open Xcode to archive and upload to App Store.

## 🎯 Game Features Implemented

### Core Mechanics
- ✅ 8x8 grid system
- ✅ 6 gem types (ruby, sapphire, emerald, topaz, amethyst, citrine)
- ✅ Swap adjacent gems
- ✅ Match 3+ detection (horizontal & vertical)
- ✅ Cascade matching
- ✅ Gravity physics

### Scoring System
- ✅ Base points: 10 per gem
- ✅ Combo multiplier (increases with consecutive matches)
- ✅ High score persistence

### UI/UX
- ✅ Home screen with high score
- ✅ Game screen with live stats
- ✅ Game over screen with replay
- ✅ Smooth animations
- ✅ Visual feedback (selection, matching)

### Timer System
- ✅ 60-second countdown
- ✅ Visual warning at 10 seconds
- ✅ Auto game over when time expires

## 🐛 Troubleshooting

### "Flutter not found"
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

### "No devices found"
- Android: Start emulator or connect phone
- iOS: Open Simulator app

### Build errors
```bash
flutter clean
flutter pub get
flutter run
```

### AdMob not showing
- Test with test Ad Unit IDs first
- Check internet connection
- Verify App IDs are correct

## 📈 Next Steps

### Enhancements You Can Add
1. **Sound Effects** - Add audio for matches, swaps, game over
2. **Power-ups** - Bombs, color changers, row/column clearers
3. **Levels** - Progressive difficulty with targets
4. **Leaderboards** - Firebase integration for global scores
5. **Daily Challenges** - Special objectives for rewards
6. **Shop System** - In-app purchases for power-ups
7. **Animations** - Particle effects, explosions
8. **Themes** - Different visual styles

### Publishing

**Google Play Store:**
1. Create developer account ($25 one-time)
2. Build app bundle
3. Upload and fill store listing
4. Submit for review

**Apple App Store:**
1. Create developer account ($99/year)
2. Build in Xcode
3. Archive and upload
4. Submit for review

## 📞 Support

For issues or questions:
- GitHub Issues: https://github.com/safiurr210-code/coed-match3-game/issues
- Email: safiurr210@gmail.com

## 🎉 You're Ready!

Your complete Match-3 game is ready to run. Just follow the setup steps and start playing!

**Happy Gaming! 🎮**
