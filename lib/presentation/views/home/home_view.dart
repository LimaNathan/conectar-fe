// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.child});
  final Widget child;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final UserViewmodel userViewmodel;
  late final LoginViewmodel loginViewmodel;
  final infoPopoverConroller = ShadPopoverController();
  final notificationsPopoverController = ShadPopoverController();
  final logoutPopoverController = ShadPopoverController();
  int _selectedIndex = 0;

  UserDetails? user;

  @override
  void initState() {
    super.initState();

    userViewmodel = context.read<UserViewmodel>();
    loginViewmodel = context.read<LoginViewmodel>();

    userViewmodel.getUserDetailsCommand
      ..call()
      ..addListener(_userListener);
    loginViewmodel.logoutCommand.addListener(_listener);

    switch (GoRouter.of(context).state.path) {
      case '/clients/list':
        _selectedIndex = 0;

        break;
      case '/users/details':
        _selectedIndex = 1;

        break;
      default:
    }
  }

  _userListener() {
    if (userViewmodel.getUserDetailsCommand.isSuccess) {
      user =
          (userViewmodel.getUserDetailsCommand.result as Ok<UserDetails>).value;
    }
  }

  void _listener() {
    if (loginViewmodel.logoutCommand.isSuccess) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    userViewmodel.getUserDetailsCommand.removeListener(_userListener);
    loginViewmodel.logoutCommand.removeListener(_listener);

    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/clients/list');

        break;
      case 1:
        context.go('/users/details');
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
        actions: [
          ShadPopover(
            controller: infoPopoverConroller,
            popover: (context) => Text('Em desenvolvimento.'),
            child: ShadButton.ghost(
              hoverBackgroundColor: colorScheme.background.withAlpha(50),
              onPressed: infoPopoverConroller.toggle,
              child: Icon(LucideIcons.info300, size: 18, color: Colors.white),
            ),
          ),
          ShadPopover(
            controller: notificationsPopoverController,
            popover: (context) => Text('Em desenvolvimento.'),
            child: ShadButton.ghost(
              hoverBackgroundColor: colorScheme.background.withAlpha(50),
              onPressed: notificationsPopoverController.toggle,
              child: Icon(
                LucideIcons.bellRing300,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          ShadPopover(
            controller: logoutPopoverController,
            popover: (context) => Padding(
              padding: EdgeInsets.all(size.width * .015),
              child: Column(
                spacing: size.height * .015,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Deseja mesmo sair?'),
                  Row(
                    spacing: size.width * .015,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShadButton.ghost(
                        onPressed: logoutPopoverController.toggle,
                        child: Text('Não', style: textTheme.small),
                      ),
                      ShadButton(
                        onPressed: loginViewmodel.logoutCommand.call,
                        child: Text(
                          'Sim',
                          style: textTheme.small.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            child: ShadButton.ghost(
              hoverBackgroundColor: colorScheme.background.withAlpha(50),
              onPressed: logoutPopoverController.toggle,
              child: Icon(LucideIcons.logOut300, size: 18, color: Colors.white),
            ),
          ),
        ],

        leadingWidth: size.width * .08,
        centerTitle: false,
        toolbarHeight: size.height * .08,
        backgroundColor: colorScheme.primary,
        title: ListenableBuilder(
          listenable: userViewmodel.getUserDetailsCommand,
          builder: (context, _) {
            return Padding(
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
                                bottom: BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
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
                    if (user != null)
                      Container(
                        padding: EdgeInsets.only(bottom: size.width * .0025),
                        decoration: _selectedIndex == 1
                            ? BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : null,
                        child: ShadButton.ghost(
                          onPressed: () => _onItemTapped(1),

                          hoverBackgroundColor: colorScheme.primaryForeground,
                          child: Text(
                            'Usuários',
                            style: textTheme.small.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: widget.child,
    );
  }
}
