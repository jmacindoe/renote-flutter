import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renote/model/Note.dart';
import 'package:renote/search/NoteSearchDelegate.dart';
import 'package:renote/search/SearchBloc.dart';
import 'package:renote/strings.dart';

class Home extends StatelessWidget {
  _addNoteRequested() {
    // TODO
  }

  _searchRequested(BuildContext context) async {
    final Note result = await showSearch(
      context: context,
      delegate: NoteSearchDelegate(BlocProvider.of<SearchBloc>(context)),
    );

    // TODO: open editor on result
  }

  _reviewRequested() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => _searchRequested(context))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Notes due today: n',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: _reviewRequested,
              child: Text(Strings.home.startReview),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNoteRequested,
        tooltip: Strings.home.addNoteTooltip,
        child: Icon(Icons.add),
      ),
    );
  }
}
