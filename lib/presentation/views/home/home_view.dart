// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.child});
  final Widget child;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/clients/list');

        break;
      case 1:
        context.go('/users');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .0035,
            vertical: size.height * .003,
          ),
          child: Image.asset(
            'assets/logo_conectar.png',
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),

        leadingWidth: size.width * .08,
        centerTitle: false,
        toolbarHeight: size.height * .08,
        backgroundColor: colorScheme.primary,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: size.width * .0025),
                  decoration: _selectedIndex == 0
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 3, color: Colors.white),
                          ),
                        )
                      : null,
                  child: ShadButton.ghost(
                    onPressed: () => _onItemTapped(0),
                    hoverBackgroundColor: colorScheme.primaryForeground,
                    child: Text(
                      'Clientes',
                      style: textTheme.small.copyWith(color: Colors.white),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(bottom: size.width * .0025),
                  decoration: _selectedIndex == 1
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 3, color: Colors.white),
                          ),
                        )
                      : null,
                  child: ShadButton.ghost(
                    onPressed: () => _onItemTapped(1),

                    hoverBackgroundColor: colorScheme.primaryForeground,
                    child: Text(
                      'Usuários',
                      style: textTheme.small.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
