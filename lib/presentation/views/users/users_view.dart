import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key, required this.child});
  final Widget child;

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  int _selectedIndex = 0;
  late final ScrollController scrollController;
  late final UserViewmodel userViewmodel;
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    userViewmodel = context.read<UserViewmodel>();
    userViewmodel.getUserDetailsCommand
      ..call()
      ..addListener(_listener);

    userViewmodel.updateCommand.addListener(_updateListener);
    userViewmodel.getAllCommand.addListener(_getAlllistener);

    switch (GoRouter.of(context).state.path) {
      case '/users/details':
        _selectedIndex = 0;

        break;
      case '/users/list':
        _selectedIndex = 1;

        break;
      default:
    }
  }

  _getAlllistener() {
    if (userViewmodel.getAllCommand.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollToBottomCenter(),
      );
    }
  }

  _updateListener() {
    if (userViewmodel.updateCommand.hasError) {
      final error = userViewmodel.updateCommand.result as Error;
      ShadToaster.of(context).show(
        ShadToast(
          title: Text('Ops, algo deu errado...'),
          description: Text(error.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    userViewmodel.getUserDetailsCommand.removeListener(_listener);
    userViewmodel.updateCommand.addListener(_updateListener);
    userViewmodel.getAllCommand.removeListener(_getAlllistener);

    super.dispose();
  }

  _listener() {
    if (userViewmodel.getUserDetailsCommand.isSuccess) {
      final currentUser =
          (userViewmodel.getUserDetailsCommand.result as Ok<UserDetails>).value;
      isAdmin = currentUser.role == 'ADMIN';
    }
  }

  void _scrollToBottomCenter() {
    if (!scrollController.hasClients) return;

    final position = scrollController.position;

    final maxScrollExtent = position.maxScrollExtent;

    final viewportExtent = position.viewportDimension;

    final targetOffset = maxScrollExtent - (viewportExtent / 2);

    scrollController.animateTo(
      targetOffset.clamp(0.0, maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/users/details');
        break;

      case 1:
        context.go('/users/list');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    return ListenableBuilder(
      listenable: userViewmodel.getUserDetailsCommand,
      builder: (context, child) {
        return ListView(
          controller: scrollController,
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
                                bottom: BorderSide(
                                  width: 3,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : null,
                      child: ShadButton.ghost(
                        onPressed: () => _onItemTapped(0),
                        hoverBackgroundColor: colorScheme.primaryForeground,
                        child: Text(
                          'Dados do usuário',
                          style: textTheme.p.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (isAdmin)
                      Container(
                        padding: EdgeInsets.only(bottom: size.width * .0025),
                        decoration: _selectedIndex == 1
                            ? BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : null,
                        child: ShadButton.ghost(
                          onPressed: () => _onItemTapped(1),
                          hoverBackgroundColor: colorScheme.primaryForeground,
                          child: Text(
                            'Lista de usuários',
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
            widget.child,
          ],
        );
      },
    );
  }
}
