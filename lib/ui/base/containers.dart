import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:github_flutter_app/model/base_model.dart';
import 'package:github_flutter_app/values/dimen.dart';
import 'package:github_flutter_app/widgets/no_data_widget.dart';

import 'base_vm.dart';

class ListContainer<BM extends ListModel, VM extends PaginatedSearchListVM>
    extends StatefulWidget {
  final String? noItemsMessage;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets? padding;
  final double? separatorHeight;
  final bool keepAlive;

  const ListContainer({
    Key? key,
    this.noItemsMessage,
    required this.itemBuilder,
    this.padding,
    this.separatorHeight,
    this.keepAlive: false,
  }) : super(key: key);

  @override
  _ListContainerState<VM> createState() => _ListContainerState<VM>();
}

class _ListContainerState<VM extends PaginatedSearchListVM>
    extends State<ListContainer> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<VM>(
      builder: (_, model, child) {
        print(model);
        if (model.isListLoading && model.list.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (model.listFailure != null) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(model.listFailure?.message ?? ""),
                TextButton(
                  child: Text('Retry'),
                  onPressed: model.retry,
                )
              ],
            ),
          );
        } else if (model.list.isEmpty) {
          return NoDataWidget(
            message: widget.noItemsMessage ?? "No data",
            onRetry: () {},
          );
        } else {
          return RefreshIndicator(
            onRefresh: model.refresh,
            child: ListView.separated(
              padding: widget.padding ?? ScreenPadding.edgeInsets,
              separatorBuilder: (_, __) =>
                  SizedBox(height: widget.separatorHeight ?? 16),
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: model.list.length,
              controller: model.scrollController,
              itemBuilder: widget.itemBuilder,
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
