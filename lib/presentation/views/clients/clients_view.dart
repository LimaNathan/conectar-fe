import 'package:conectar_users_fe/common/utils/reponsivity_util.dart';
import 'package:conectar_users_fe/models/utils/device_screen_type_enum.dart';
import 'package:conectar_users_fe/presentation/viewmodels/clients/client_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key, required this.child});
  final Widget child;

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  int _selectedIndex = 0;
  late final ScrollController scrollController;
  late final ClientViewmodel clientViewmodel;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    clientViewmodel = context.read<ClientViewmodel>();

    clientViewmodel.getAllCommand.addListener(listener);
    switch (GoRouter.of(context).state.path) {
      case '/clients/list':
        _selectedIndex = 0;
      default:
    }
  }

  listener() {
    if (clientViewmodel.getAllCommand.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollToBottomCenter(),
      );
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

  @override
  void dispose() {
    clientViewmodel.getAllCommand.removeListener(listener);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    final deviceType = ResponsivityUtil().getDeviceType(context);
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
                              color: deviceType == DeviceScreenType.mobile
                                  ? colorScheme.primary
                                  : Colors.black,
                            ),
                          ),
                        )
                      : null,
                  child: ShadButton.ghost(
                    onPressed: () => _onItemTapped(0),
                    hoverBackgroundColor: colorScheme.accent.withAlpha(155),
                    child: Text(
                      'Dados Básicos',
                      style: deviceType == DeviceScreenType.mobile
                          ? null
                          : textTheme.p.copyWith(
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
