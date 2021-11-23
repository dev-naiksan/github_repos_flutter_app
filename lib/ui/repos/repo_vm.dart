import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:github_flutter_app/data/network/util/error_util.dart';
import 'package:github_flutter_app/data/repository/repo/repo_repository.dart';
import 'package:github_flutter_app/model/repo_model.dart';
import 'package:github_flutter_app/ui/base/base_result.dart';
import 'package:github_flutter_app/ui/base/base_vm.dart';

class RepoVM extends BaseVM {
  int _page = 1;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isOver = false;

  bool get isOver => _isOver;

  UiFailure? _failure;

  UiFailure? get failure => _failure;

  RepoRepository repository = GetIt.I.get<RepoRepository>();

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
      final repos = await repository.fetchRepos(_page);
      _page++;
      _isOver = repos.isEmpty;
    } catch (e, stack) {
      _failure = UiFailure(ErrorUtil.getApiError(e));
      debugPrintStack(stackTrace: stack);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Stream<List<Repo>> get repoStream => repository.repoStream;

  @override
  void onNetworkAvailable(bool available) {}
}
