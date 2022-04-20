import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_flutter_app/data/repository/base_repository.dart';
import 'package:github_flutter_app/model/base_model.dart';
import 'package:github_flutter_app/utils/constants.dart';

import '../../data/network/util/error_util.dart';
import 'ui_result/ui_result.dart';

abstract class BaseVM with ChangeNotifier {
  StreamSubscription? _internetConnectionSubscription;

  void onNetworkAvailable(bool available);

  BaseVM() {
    _internetConnectionSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      var available = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
      onNetworkAvailable(available);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _internetConnectionSubscription?.cancel();
    super.dispose();
  }
}

abstract class PaginatedSearchListVM<A extends ListModel,
    B extends BaseRepository> extends BaseVM {
  final B repository = GetIt.I.get<B>();

  bool _isLoading = false;
  UiFailure? _failure;
  List<A> _list = [];
  bool _isEnded = false;
  Timer? _debounceTimer;

  List<A> get list => _list;

  bool get isListLoading => _isLoading;

  UiFailure? get listFailure => _failure;

  bool get isEnded => _isEnded;

  final ScrollController scrollController = new ScrollController();
  TextEditingController keywordTextController = TextEditingController();

  PaginatedSearchListVM() {
    _initScrollController();
    _fetch();
  }

  void onTextChanged(String text) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _isEnded = false;
      _list.clear();
      _fetch();
    });
  }

  void _initScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.extentAfter <
          AppConstants.LOAD_MORE_THRESHOLD) {
        _fetch();
      }
    });
  }

  Future refresh() async {
    _isEnded = false;
    _list.clear();
    _list = await get();
    notifyListeners();
  }

  void _fetch() async {
    _failure = null;
    if (_isLoading || _isEnded) return;

    _isLoading = true;
    _failure = null;
    notifyListeners();

    try {
      final result = await get();
      _list.addAll(result);
      _isEnded = result.isEmpty;
    } catch (e, stack) {
      _failure = ErrorUtil.getUiFailureFromException(e, stack);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<A>> get();

  void retry() {
    _fetch();
  }

  @override
  void onNetworkAvailable(bool available) {}

  @override
  void dispose() {
    _debounceTimer?.cancel();
    keywordTextController.dispose();
    super.dispose();
  }
}
