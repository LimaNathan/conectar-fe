import 'package:conectar_users_fe/common/utils/reponsivity_util.dart';
import 'package:conectar_users_fe/models/users/dto/user_pagination_query.dart';
import 'package:conectar_users_fe/models/utils/device_screen_type_enum.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UsersFiltersComponent extends StatefulWidget {
  const UsersFiltersComponent({super.key});

  @override
  State<UsersFiltersComponent> createState() => _UsersFiltersComponentState();
}

class _UsersFiltersComponentState extends State<UsersFiltersComponent> {
  late final UserViewmodel userViewmodel;
  final responsivity = ResponsivityUtil();

  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final roleEC = TextEditingController();

  final orderController = ShadSelectController<OrderDirection>();

  @override
  void initState() {
    super.initState();
    userViewmodel = context.read<UserViewmodel>();
    cleanFilters();
  }

  void cleanFilters() {
    nameEC.clear();
    emailEC.clear();
    roleEC.clear();
    orderController.value.clear();
    userViewmodel.query.cleanFilters();
    setState(() {});
  }

  void onSend(String value) {
    userViewmodel.getAllCommand.call();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    final deviceType = responsivity.getDeviceType(context);

    if (deviceType == DeviceScreenType.mobile) {
      return ListView(
        shrinkWrap: true,
        children: [
          ShadInputFormField(
            controller: nameEC,
            onSubmitted: onSend,
            label: Text('Buscar por nome', style: textTheme.small),
            onChanged: (value) => userViewmodel.query.name = value,
          ),
          SizedBox(height: size.height * .03),

          ShadInputFormField(
            controller: emailEC,
            onSubmitted: onSend,
            label: Text('Buscar por e-mail', style: textTheme.small),
            onChanged: (value) => userViewmodel.query.email = value,
          ),
          SizedBox(height: size.height * .03),

          ShadInputFormField(
            controller: roleEC,
            onSubmitted: onSend,
            label: Text('Buscar por papel', style: textTheme.small),
            onChanged: (value) => userViewmodel.query.role = value,
          ),
          SizedBox(height: size.height * .03),

          ShadSelect<OrderDirection>(
            controller: orderController,
            header: const Text('Selecione uma ordem'),
            allowDeselection: true,
            onChanged: (value) => userViewmodel.query.order = value,
            placeholder: const Text('Ordenar por'),
            options: OrderDirection.values
                .map(
                  (e) =>
                      ShadOption(value: e, child: Text(e.name.toUpperCase())),
                )
                .toList(),
            selectedOptionBuilder: (context, value) =>
                Text(value.name.toUpperCase()),
          ),
          SizedBox(height: size.height * .03),
          Row(
            spacing: size.width * .04,
            children: [
              Expanded(
                child: ShadButton.outline(
                  onPressed: cleanFilters,
                  child: Text('Limpar campos'),
                ),
              ),
              Expanded(
                child: ShadButton(
                  onPressed: userViewmodel.getAllCommand.call,
                  child: Text('Filtrar'),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .03),
        ],
      );
    }

    return SizedBox(
      height: size.height * .45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: size.height * .04,
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 5,
              mainAxisSpacing: 3,
              crossAxisSpacing: 15,
            ),
            shrinkWrap: true,
            children: [
              ShadInputFormField(
                controller: nameEC,
                onSubmitted: onSend,
                label: Text('Buscar por nome', style: textTheme.small),
                onChanged: (value) => userViewmodel.query.name = value,
              ),
              ShadInputFormField(
                controller: emailEC,
                onSubmitted: onSend,
                label: Text('Buscar por e-mail', style: textTheme.small),
                onChanged: (value) => userViewmodel.query.email = value,
              ),
              ShadInputFormField(
                controller: roleEC,
                onSubmitted: onSend,
                label: Text('Buscar por papel', style: textTheme.small),
                onChanged: (value) => userViewmodel.query.role = value,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: size.width * .01,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ordenar por', style: textTheme.small),
                  SizedBox(height: size.width * .0053),
                  ShadSelect<OrderDirection>(
                    controller: orderController,
                    header: const Text('Selecione uma ordem'),
                    allowDeselection: true,
                    onChanged: (value) => userViewmodel.query.order = value,
                    placeholder: SizedBox(
                      width: size.width * .25,
                      child: const Text('Selecione'),
                    ),
                    padding: EdgeInsets.all(size.width * .005),
                    itemCount: OrderDirection.values.length,
                    options: OrderDirection.values
                        .map(
                          (e) => ShadOption(
                            value: e,
                            child: Text(e.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    selectedOptionBuilder: (context, value) {
                      return SizedBox(
                        width: size.width * .25,
                        child: Text(value.name.toUpperCase()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: size.width * .215,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: size.width * .01,
              children: [
                Expanded(
                  child: ShadButton.outline(
                    decoration: ShadDecoration(
                      border: ShadBorder.all(color: colorScheme.primary),
                    ),
                    onPressed: cleanFilters,
                    child: Text(
                      'Limpar campos',
                      style: textTheme.p.copyWith(
                        color: colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ShadButton(
                    decoration: ShadDecoration(
                      border: ShadBorder.all(color: colorScheme.primary),
                    ),
                    onPressed: userViewmodel.getAllCommand.call,
                    child: Text(
                      'Filtrar',
                      style: textTheme.p.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
