import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int rating;
  final VoidCallback onStarTap;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(location,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.hintColor)),
              ],
            ),
          ),
          // Tap the star chip to increase the rating count.
          InkWell(
            onTap: onStarTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text('$rating',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
