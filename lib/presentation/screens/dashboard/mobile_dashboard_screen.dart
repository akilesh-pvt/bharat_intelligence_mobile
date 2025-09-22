import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/platform/platform_detector.dart';
import '../../widgets/common/mobile_app_bar.dart';
import '../../widgets/common/mobile_bottom_navigation.dart';
import '../dashboard/widgets/metric_cards_section.dart';
import '../dashboard/widgets/recent_activities_widget.dart';
import '../dashboard/widgets/quick_actions_panel.dart';

class MobileDashboardScreen extends StatefulWidget {
  const MobileDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MobileDashboardScreen> createState() => _MobileDashboardScreenState();
}

class _MobileDashboardScreenState extends State<MobileDashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MobileAppBar(
        title: 'Dashboard',
        showBackButton: false,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                _buildWelcomeSection(),
                const SizedBox(height: 24),
                
                // Metrics Cards
                const MetricCardsSection(),
                const SizedBox(height: 24),
                
                // Quick Actions
                const QuickActionsPanel(),
                const SizedBox(height: 24),
                
                // Recent Activities
                const RecentActivitiesWidget(),
                
                // Chrome preview info
                if (PlatformDetector.isWeb) ...[
                  const SizedBox(height: 24),
                  _buildChromePreviewInfo(),
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MobileBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.waving_hand,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Manage your field operations',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChromePreviewInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.web, color: Colors.blue[700]),
              const SizedBox(width: 8),
              Text(
                'Chrome Testing Mode',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'This is a mobile-first app running in Chrome for development. Use Chrome DevTools to simulate different device sizes.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[800],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleRefresh() async {
    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    switch (index) {
      case 0:
        // Dashboard - already here
        break;
      case 1:
        context.go('/dashboard/visitors');
        break;
      case 2:
        context.go('/dashboard/farmers');
        break;
      case 3:
        context.go('/dashboard/tasks');
        break;
      case 4:
        context.go('/dashboard/allowances');
        break;
    }
  }
}