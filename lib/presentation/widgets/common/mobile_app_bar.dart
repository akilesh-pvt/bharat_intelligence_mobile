import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const MobileAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey[900],
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 20),
              onPressed: onBackPressed ?? () => context.pop(),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions ?? [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // TODO: Implement notifications
          },
        ),
        IconButton(
          icon: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.person,
              size: 20,
              color: Colors.grey[600],
            ),
          ),
          onPressed: () {
            // TODO: Implement profile menu
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}