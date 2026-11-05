import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  Widget _button(BuildContext context, IconData icon, String label) {
    final color = Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$label tapped'))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button(context, Icons.call, 'CALL'),
          _button(context, Icons.directions, 'ROUTE'),
          _button(context, Icons.share, 'SHARE'),
        ],
      ),
    );
  }
}
