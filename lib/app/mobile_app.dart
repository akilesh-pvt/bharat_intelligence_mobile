import 'package:flutter/material.dart';
import '../core/platform/platform_detector.dart';
import '../config/mobile_theme.dart';
import 'app_router.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bharat Intelligence Admin',
      theme: MobileTheme.lightTheme,
      darkTheme: MobileTheme.darkTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      
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
}