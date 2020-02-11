import 'package:flutter/material.dart';
import 'package:renote/strings.dart';

class Home extends StatelessWidget {
  _addNote() {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Notes due today: n',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Start review button',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: Strings.addNoteTooltip,
        child: Icon(Icons.add),
      ),
    );
  }
}
