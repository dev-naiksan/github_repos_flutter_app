import 'package:get_it/get_it.dart';
import 'package:github_flutter_app/data/network/util/error_util.dart';
import 'package:github_flutter_app/data/repository/auth/auth_repository.dart';
import 'package:github_flutter_app/ui/base/base_vm.dart';

import '../base/ui_result/ui_result.dart';

class AuthVM extends BaseVM {
  final AuthRepository repository = GetIt.I.get<AuthRepository>();
  bool _loading = false;

  bool get loading => _loading;

  Future<UiResult<bool>> login(String email, String password) async {
    try {
      _loading = true;
      notifyListeners();
      await repository.login(email, password);
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  @override
  void onNetworkAvailable(bool available) {}
}
