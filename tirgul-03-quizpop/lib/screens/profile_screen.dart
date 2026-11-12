import 'package:flutter/material.dart';

/// תחנה 3 (T1): מסך פרופיל עם השם שלי.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('הפרופיל שלי')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 56,
                backgroundColor: colors.primaryContainer,
                child: Text('מ',
                    style: TextStyle(fontSize: 48, color: colors.primary)),
              ),
              const SizedBox(height: 16),
              Text('מאיה סחורי',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text('סטודנטית להנדסת תוכנה · מכללת כנרת',
                  style: TextStyle(color: colors.onSurfaceVariant)),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Stat(label: 'קורסים', value: '6'),
                  SizedBox(width: 32),
                  _Stat(label: 'שנה', value: '4'),
                  SizedBox(width: 32),
                  _Stat(label: 'פרויקטים', value: '8'),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('שלום! 👋')),
                  );
                },
                icon: const Icon(Icons.waving_hand),
                label: const Text('תגידו שלום'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}
