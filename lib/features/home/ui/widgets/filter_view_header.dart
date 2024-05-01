import 'package:flutter/material.dart';

class FilterViewHeader extends StatelessWidget {
  const FilterViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.filter_list,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Text(
              'Filter',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}
