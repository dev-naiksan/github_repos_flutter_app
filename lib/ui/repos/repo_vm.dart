import 'package:github_flutter_app/data/network/util/base_response.dart';
import 'package:github_flutter_app/data/network/util/error_util.dart';
import 'package:github_flutter_app/data/repository/base_repository.dart';
import 'package:github_flutter_app/data/repository/repo/repo_repository.dart';
import 'package:github_flutter_app/data/repository/repo/repo_repository_impl.dart';
import 'package:github_flutter_app/model/repo_model.dart';
import 'package:github_flutter_app/ui/base/base_vm.dart';

import '../base/ui_result/ui_result.dart';

class RepoVM extends BaseVM {
  int _page = 1;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isOver = false;

  bool get isOver => _isOver;

  UiFailure? _failure;

  UiFailure? get failure => _failure;

  List<Repo> _list = [];

  List<Repo> get list => _list;

  RepoRepository repository = RepoRepositoryImpl();

  RepoVM() {
    fetchRepos();
  }

  void fetchRepos() async {
    try {
      if (_isLoading || _isOver) {
        return;
      }
      _failure = null;
      _isLoading = true;
      notifyListeners();
      final result = await repository.fetchRepos(_page);
      if (result.source == RepositoryResultSource.cached &&
          result.data.isEmpty) {
        _failure = UiFailure(ErrorType.apiFailure);
      } else {
        _isOver = result.data.isEmpty;
        _page++;
      }
      _list.addAll(result.data);
    } catch (e, stack) {
      _failure = ErrorUtil.getUiFailureFromException(e, stack);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void onNetworkAvailable(bool available) {}
}
