import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 22,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Icon(
            LucideIcons.chevronRight,
            size: 20,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}