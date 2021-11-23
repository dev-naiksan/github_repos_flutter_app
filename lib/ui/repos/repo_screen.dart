import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_flutter_app/model/repo_model.dart';
import 'package:github_flutter_app/ui/repos/repo_vm.dart';
import 'package:github_flutter_app/utils/constants.dart';
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
        body: StreamBuilder<List<Repo>>(
          stream: model.repoStream,
          builder: (context, snapshot) {
            final list = snapshot.data;
            if (!snapshot.hasData || list == null || list.isEmpty) {
              return Center(child: CircularProgressIndicator.adaptive());
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
                        Text(model.failure?.message ?? "Some error occurred"),
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
          },
        ),
      ),
    );
  }
}
