import 'package:absence_mananger/features/home/ui/widgets/list_filter_button.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absence Manager'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [
          ListFilterButton(),
        ],
      ),
      body: const HomeView(),
    );
  }
}
