import 'package:absence_mananger/common/extensions/string_extension.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/common/utils/date_utils.dart';
import 'package:absence_mananger/features/home/ui/widgets/absence_note_view.dart';
import 'package:absence_mananger/features/home/ui/widgets/absence_status_view.dart';
import 'package:flutter/material.dart';

class AbsenceItem extends StatelessWidget {
  const AbsenceItem({super.key, required this.absence});

  final Absence absence;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                absence.member.name,
                style: theme.textTheme.titleLarge,
              ),
              AbsenceStatusView(status: absence.status),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (absence.days > 0)
                Expanded(
                  child: Text(
                    '${DateUtil.getFormattedDate(absence.startDate!, 'dd/MM/yyyy')}${absence.days == 1 ? '' : ' - ${DateUtil.getFormattedDate(absence.endDate!, 'dd/MM/yyyy')}'}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              const SizedBox.shrink(),
              Text(
                absence.type.name.capitalized(),
                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (absence.memberNote.isNotEmpty) ...[
            const SizedBox(height: 4),
            AbsenceNoteView(
              title: 'Member Note:',
              body: absence.memberNote,
            ),
          ],
          if (absence.admitterNote.isNotEmpty) ...[
            const SizedBox(height: 4),
            AbsenceNoteView(
              title: 'Admitter Note:',
              body: absence.admitterNote,
            ),
          ],
        ],
      ),
    );
  }
}
