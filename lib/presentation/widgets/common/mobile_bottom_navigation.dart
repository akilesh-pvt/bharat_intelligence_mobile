import 'package:flutter/material.dart';

class MobileBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MobileBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.dashboard_outlined,
                activeIcon: Icons.dashboard,
                label: 'Dashboard',
                index: 0,
                isActive: currentIndex == 0,
              ),
              _buildNavItem(
                icon: Icons.people_outline,
                activeIcon: Icons.people,
                label: 'Visitors',
                index: 1,
                isActive: currentIndex == 1,
              ),
              _buildNavItem(
                icon: Icons.agriculture_outlined,
                activeIcon: Icons.agriculture,
                label: 'Farmers',
                index: 2,
                isActive: currentIndex == 2,
              ),
              _buildNavItem(
                icon: Icons.task_outlined,
                activeIcon: Icons.task,
                label: 'Tasks',
                index: 3,
                isActive: currentIndex == 3,
              ),
              _buildNavItem(
                icon: Icons.payment_outlined,
                activeIcon: Icons.payment,
                label: 'Allowance',
                index: 4,
                isActive: currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    const primaryBlue = Color(0xFF2563EB);
    const grey500 = Color(0xFF6B7280);
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? primaryBlue.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? primaryBlue : grey500,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? primaryBlue : grey500,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}