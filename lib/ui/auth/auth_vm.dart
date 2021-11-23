import 'package:get_it/get_it.dart';
import 'package:github_flutter_app/data/network/util/base_response.dart';
import 'package:github_flutter_app/data/repository/auth/auth_repository.dart';
import 'package:github_flutter_app/ui/base/base_result.dart';
import 'package:github_flutter_app/ui/base/base_vm.dart';
import 'package:github_flutter_app/utils/constants.dart';
import 'package:github_flutter_app/utils/functions.dart';

class AuthVM extends BaseVM {
  final AuthRepository repository = GetIt.I.get<AuthRepository>();
  bool _loading = false;
  bool get loading => _loading;

  Future<UiResult> login(String email, String password) async {
    if (!isEmailValid(email)) {
      return UiFailure('Please enter valid email');
    }
    if (password.length < AppConstants.PASSWORD_MIN_LENGTH) {
      return UiFailure(
          'Password must be at least ${AppConstants.PASSWORD_MIN_LENGTH} characters long');
    }
    try {
      _loading = true;
      notifyListeners();
      await repository.login(email, password);
      return UiSuccess(true);
    } on ApiError catch (e) {
      return UiFailure(e.errorMessage);
    }finally{
      _loading = false;
      notifyListeners();
    }
  }

  @override
  void onNetworkAvailable(bool available) {}
}
