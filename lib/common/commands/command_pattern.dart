import 'package:flutter/foundation.dart';

// Representa void;
const unit = Unit();

class Result<T> {
  const Result();
}

class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

class Error<T> extends Result<T> {
  const Error(this.exception);
  final Object exception;
}

class Unit {
  const Unit();
}

abstract class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;
  Result<T>? _result;

  bool get running => _running;

  Result<T>? get result => _result;

  bool get hasError => _result is Error;

  bool get isSuccess => _result is Ok;

  @protected
  Future<void> run(Future<Result<T>> Function() action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } catch (e) {
      _result = Error(e);
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command<T> {
  Command0(this._action);
  final Future<Result<T>> Function() _action;

  Future<void> call() => run(_action);
}

class Command1<T, TParam> extends Command<T> {
  Command1(this._action);
  final Future<Result<T>> Function(TParam) _action;

  Future<void> call(TParam param) => run(() => _action(param));
}

class Command2<T, TParam1, TParam2> extends Command<T> {
  Command2(this._action);
  final Future<Result<T>> Function(TParam1, TParam2) _action;

  Future<void> call(TParam1 param1, TParam2 param2) =>
      run(() => _action(param1, param2));
}
