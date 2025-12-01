import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/home_screen.dart';
import 'models/game_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Mobile Ads
  await MobileAds.instance.initialize();
  
  // Set portrait orientation only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const CoedGame());
}

class CoedGame extends StatelessWidget {
  const CoedGame({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameState(),
      child: MaterialApp(
        title: 'Coed - Match 3',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'GameFont',
          scaffoldBackgroundColor: const Color(0xFF1a1a2e),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
