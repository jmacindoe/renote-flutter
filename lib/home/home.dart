import 'package:flutter/material.dart';
import 'package:renote/strings.dart';

class Home extends StatelessWidget {
  _addNoteRequested() {
    // TODO
  }

  _searchRequested() {}

  _reviewRequested() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: _searchRequested)
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