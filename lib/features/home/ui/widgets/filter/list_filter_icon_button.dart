import 'package:absence_mananger/features/home/ui/widgets/filter/filter_view.dart';
import 'package:flutter/material.dart';

class ListFilterIconButton extends StatelessWidget {
  const ListFilterIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () => _showFilterSheet(context),
    );
  }

  _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const FilterView();
      },
    );
  }
}
