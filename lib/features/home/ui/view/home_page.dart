import 'package:absence_mananger/features/home/ui/widgets/absences-list/absence_total_count_view.dart';
import 'package:absence_mananger/features/home/ui/widgets/filter/list_filter_icon_button.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AbsenceTotalCountView(placeholder: 'Absence Manager'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [
          ListFilterIconButton(),
        ],
      ),
      body: const HomeView(),
    );
  }
}
