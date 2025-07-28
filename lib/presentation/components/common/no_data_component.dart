import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NoDataComponent extends StatelessWidget {
  const NoDataComponent({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        children: [
          Icon(LucideIcons.archive100, size: 36),
          SizedBox(height: size.height * .03),
          Text(
            'Nenhum dado para mostrar',
            style: ShadTheme.of(context).textTheme.h4,
          ),
          Text(message),
        ],
      ),
    );
  }
}
