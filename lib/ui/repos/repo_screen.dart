import 'package:flutter/material.dart';
import 'package:github_flutter_app/data/network/util/error_util.dart';
import 'package:github_flutter_app/ui/repos/repo_vm.dart';
import 'package:provider/provider.dart';

class RepoScreen extends StatefulWidget {
  static const String routeName = 'repo';

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    final model = Provider.of<RepoVM>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        model.fetchRepos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RepoVM>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Jack\'s Git'),
        ),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    final model = Provider.of<RepoVM>(context, listen: false);
    final list = model.list;

    if (model.isLoading && list.isEmpty) {
      return Center(child: CircularProgressIndicator.adaptive());
    }
    final failure = model.failure;
    if (failure != null && list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(ErrorUtil.getErrorMessageFromUiFailure(failure)),
            TextButton(
              onPressed: () {
                model.fetchRepos();
              },
              child: Text('Retry'),
            )
          ],
        ),
      );
    }

    return ListView(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        ListView.separated(
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.bookmark),
            title: Text(list[index].name),
            isThreeLine: true,
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list[index].description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.code,
                      size: 16,
                    ),
                    Text(list[index].language),
                    SizedBox(width: 12),
                    Icon(
                      Icons.bug_report,
                      size: 16,
                    ),
                    Text('${list[index].issues}'),
                    SizedBox(width: 12),
                    Icon(
                      Icons.person,
                      size: 16,
                    ),
                    Text('${list[index].watchers}'),
                  ],
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Divider(),
        ),
        Visibility(
          visible: model.isLoading && !model.isOver,
          child: Center(child: CircularProgressIndicator.adaptive()),
        ),
        Visibility(
          visible: model.failure != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ErrorUtil.getErrorMessageFromUiFailure(model.failure!)),
                TextButton(
                  onPressed: () {
                    model.fetchRepos();
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
