import 'package:absence_mananger/common/extensions/string_extension.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:flutter/material.dart';

class AbsenceStatusView extends StatelessWidget {
  const AbsenceStatusView({
    super.key,
    required this.status,
  });
  final AbsenceStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: status == AbsenceStatus.confirmed
            ? Colors.green
            : status == AbsenceStatus.rejected
                ? Colors.red
                : Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.name.capitalized(),
        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
