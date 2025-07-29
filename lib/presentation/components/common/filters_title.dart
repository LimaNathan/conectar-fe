import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FiltersTitle extends StatelessWidget {
  const FiltersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    return ListTile(
      leading: Icon(Icons.search, color: colorScheme.primary, size: 24),
      subtitle: Text(
        'Filtre e busque itens na página',
        style: textTheme.lead.copyWith(fontSize: 12),
      ),
      title: Text(
        'Filtros',
        style: textTheme.list.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
