import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renote/data/note/models/note.dart';
import 'package:renote/editor/editor.dart';
import 'package:renote/review/review.dart';
import 'package:renote/search/note_search_delegate.dart';
import 'package:renote/search/search_bloc.dart';
import 'package:renote/strings.dart';

class Home extends StatelessWidget {
  _addNoteRequested(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Editor()));
  }

  _searchRequested(BuildContext context) async {
    final Note note = await showSearch(
      context: context,
      delegate: NoteSearchDelegate(BlocProvider.of<SearchBloc>(context)),
    );

    if (note != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Editor(note: note)));
    }
  }

  _reviewRequested(BuildContext context) {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => Review()));
  }

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
              onPressed: () => _reviewRequested(context),
              child: Text(Strings.home.startReview),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNoteRequested(context),
        tooltip: Strings.home.addNoteTooltip,
        child: Icon(Icons.add),
      ),
    );
  }
}
