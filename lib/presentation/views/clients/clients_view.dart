import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key, required this.child});
  final Widget child;

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/clients/list');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    return ListView(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * .0025),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: size.width * .0025),
                  decoration: _selectedIndex == 0
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 3, color: Colors.black),
                          ),
                        )
                      : null,
                  child: ShadButton.ghost(
                    onPressed: () => _onItemTapped(0),
                    hoverBackgroundColor: colorScheme.primaryForeground,
                    child: Text(
                      'Dados Básicos',
                      style: textTheme.p.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(size.width * .03), child: widget.child),
      ],
    );
  }
}
