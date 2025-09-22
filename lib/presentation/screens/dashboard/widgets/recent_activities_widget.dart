import 'package:flutter/material.dart';

class RecentActivitiesWidget extends StatelessWidget {
  const RecentActivitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activities',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
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
            children: [
              _buildActivityItem(
                icon: Icons.person_add,
                iconColor: const Color(0xFF10B981),
                title: 'New visitor registered',
                subtitle: 'Rajesh Kumar added to field team',
                time: '2 hours ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                icon: Icons.task_alt,
                iconColor: const Color(0xFF3B82F6),
                title: 'Task completed',
                subtitle: 'Farm inspection at Village Rampur',
                time: '4 hours ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                icon: Icons.payment,
                iconColor: const Color(0xFFF59E0B),
                title: 'Allowance approved',
                subtitle: '₹2,500 fuel allowance for Suresh',
                time: '6 hours ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                icon: Icons.agriculture,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Farmer profile updated',
                subtitle: 'Crop details added for Ram Singh',
                time: '1 day ago',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 2),
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
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}