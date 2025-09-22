import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/mobile_app.dart';
import 'core/platform/platform_detector.dart';
import 'config/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: ".env");
  
  // Initialize Supabase
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    anonKey: Environment.supabaseAnonKey,
  );
  
  // Mobile-specific configurations (ignored on web)
  if (PlatformDetector.isMobile) {
    // Force portrait orientation on mobile
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
    // Mobile status bar styling
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
  
  runApp(const BharatIntelligenceMobileApp());
}

class BharatIntelligenceMobileApp extends StatelessWidget {
  const BharatIntelligenceMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bharat Intelligence',
      theme: _buildLightTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      
      // Mobile app builder with Chrome support
      builder: (context, child) {
        // Mobile-first responsive settings for Chrome testing
        if (PlatformDetector.isWeb) {
          return Container(
            color: Colors.grey[100],
            child: Center(
              child: Container(
                width: 414, // iPhone Pro Max width
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: child ?? Container(),
                ),
              ),
            ),
          );
        }
        return child ?? Container();
      },
    );
  }
  
  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    );
  }
}