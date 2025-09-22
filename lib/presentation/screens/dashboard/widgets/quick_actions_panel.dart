import 'package:flutter/material.dart';

class QuickActionsPanel extends StatelessWidget {
  const QuickActionsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            _buildActionCard(
              title: 'Add Visitor',
              subtitle: 'Register new field visitor',
              icon: Icons.person_add,
              color: const Color(0xFF3B82F6),
              onTap: () {},
            ),
            _buildActionCard(
              title: 'Create Task',
              subtitle: 'Assign new field task',
              icon: Icons.add_task,
              color: const Color(0xFF10B981),
              onTap: () {},
            ),
            _buildActionCard(
              title: 'Add Farmer',
              subtitle: 'Register farmer profile',
              icon: Icons.agriculture,
              color: const Color(0xFFF59E0B),
              onTap: () {},
            ),
            _buildActionCard(
              title: 'Approve Allowance',
              subtitle: 'Review pending requests',
              icon: Icons.check_circle,
              color: const Color(0xFF8B5CF6),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}