import 'package:absence_mananger/common/constants/spacing.dart';
import 'package:absence_mananger/common/extensions/string_extension.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/common/utils/date_utils.dart';
import 'package:absence_mananger/features/home/ui/widgets/absences-list/absence_note_view.dart';
import 'package:absence_mananger/features/home/ui/widgets/absences-list/absence_status_view.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';

class AbsenceItem extends StatelessWidget {
  const AbsenceItem({super.key, required this.absence});

  final Absence absence;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
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
          Spacing.vertical,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                  onPressed: _saveToCalendar,
                  label: const Text('Share'),
                  icon: const Icon(
                    Icons.ios_share_outlined,
                    size: 20,
                  )),
              if (absence.member.image != null)
                ClipOval(
                  child: SizedBox.square(
                    dimension: 40,
                    child: Image.network(
                      absence.member.image!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  void _saveToCalendar() {
    final description = StringBuffer();
    description.writeln('Type: ${absence.type.name.capitalized()}');
    description.writeln();
    if (absence.memberNote.isNotEmpty) {
      description.writeln('Member Note:\n${absence.memberNote}');
    }
    description.writeln();
    if (absence.admitterNote.isNotEmpty) {
      description.writeln('Admitter Note:\n${absence.admitterNote}');
    }

    final Event event = Event(
      title: '${absence.member.name} - ${absence.status.name.capitalized()}',
      description: description.toString(),
      startDate: absence.startDate!,
      endDate: absence.startDate!,
    );

    Add2Calendar.addEvent2Cal(event);
  }
}
