import 'package:flutter/material.dart';
import 'package:discussify/theme/app_theme.dart';

class BottomActionBar extends StatelessWidget {
  final VoidCallback onCreateUserPressed;
  final VoidCallback onThoughtPressed;

  const BottomActionBar({
    super.key,
    required this.onCreateUserPressed,
    required this.onThoughtPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        border: Border(
          top: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onCreateUserPressed,
              icon: const Icon(Icons.person_add),
              label: const Text('Create User'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onThoughtPressed,
              icon: const Icon(Icons.lightbulb_outline),
              label: const Text('Thought'),
            ),
          ),
        ],
      ),
    );
  }
}
