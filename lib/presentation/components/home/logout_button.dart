import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  final logoutPopoverController = ShadPopoverController();
  late final LoginViewmodel loginViewmodel;
  @override
  void initState() {
    super.initState();
    loginViewmodel = context.read<LoginViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;

    return ShadPopover(
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
    );
  }
}
