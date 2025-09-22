import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../core/platform/platform_detector.dart';
import '../config/mobile_theme.dart';
import 'app_router.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      MaterialApp.router(
        title: 'Bharat Intelligence Admin',
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