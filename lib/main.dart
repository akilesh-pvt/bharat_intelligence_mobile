import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/mobile_app.dart';
import 'core/platform/platform_detector.dart';
import 'config/environment.dart';
import 'config/mobile_theme.dart';
import 'app/app_router.dart';

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
  const BharatIntelligenceMobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      MaterialApp.router(
        title: 'Bharat Intelligence',
        theme: MobileTheme.lightTheme,
        darkTheme: MobileTheme.darkTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        
        // Mobile app builder with Chrome support
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            // Mobile-first responsive settings
            maxWidth: PlatformDetector.isWeb ? 414 : double.infinity,
            minWidth: 320,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(320, name: 'MOBILE_SMALL'),
              const ResponsiveBreakpoint.resize(375, name: 'MOBILE'),
              const ResponsiveBreakpoint.resize(414, name: 'MOBILE_LARGE'),
              const ResponsiveBreakpoint.resize(768, name: 'TABLET'),
            ],
            background: Container(
              color: PlatformDetector.isWeb ? Colors.grey[100] : null,
              // Add mobile frame in Chrome for better visualization
              child: PlatformDetector.isWeb 
                ? Center(
                    child: Container(
                      width: 414, // iPhone Pro Max width
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        child: child ?? Container(),
                      ),
                    ),
                  )
                : child,
            ),
          );
        },
      ),
      maxWidth: PlatformDetector.isWeb ? 414 : 1200,
      minWidth: 320,
      defaultScale: true,
    );
  }
}