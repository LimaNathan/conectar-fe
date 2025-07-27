import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        children: [
          Icon(LucideIcons.frown300, size: 36),
          SizedBox(height: size.height * .03),
          Text('Algo deu errado...'),
          Text(message),
        ],
      ),
    );
  }
}
