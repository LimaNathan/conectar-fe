import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => LoginViewModel(),
  ),
];
