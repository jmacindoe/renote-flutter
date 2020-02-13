import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optional/optional.dart';
import 'package:renote/editor/editor_bloc.dart';
import 'package:renote/editor/editor_event.dart';
import 'package:renote/editor/editor_state.dart';
import 'package:renote/editor/next_due_pad.dart';
import 'package:renote/strings.dart';

class InternalEditor extends StatefulWidget {
  @override
  _InternalEditorState createState() => _InternalEditorState();
}

class _InternalEditorState extends State<StatefulWidget> {
  var _textController;

  _onDueDaysChanged(BuildContext context, int dueDays) {
    BlocProvider.of<EditorBloc>(context).add(DueDateUpdatedEvent(dueDays));
  }

  _onBodyChanged(BuildContext context, String body) {
    BlocProvider.of<EditorBloc>(context).add(BodyUpdatedEvent(body));
  }

  _discardEdit(BuildContext context) {
    final EditorBloc bloc = BlocProvider.of<EditorBloc>(context);
    // TODO: UI tests for this
    if (bloc.state.body != bloc.uneditedBody ||
        bloc.state.dueDays != bloc.uneditedDueDays) {
      _showConfirmDiscardDialog(context);
    } else {
      bloc.add(FinishedEditingEvent());
    }
  }

  _finishEditing(BuildContext context) {
    BlocProvider.of<EditorBloc>(context).add(FinishedEditingEvent());
  }

  @override
  Widget build(BuildContext context) {
    if (_textController == null) {
      final initialText = BlocProvider.of<EditorBloc>(context).state.body;
      _textController = TextEditingController(text: initialText);
    }

    return BlocConsumer<EditorBloc, EditorState>(listener: (context, state) {
      if (state.finishedEditing) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: Text(_screenTitle(state)),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () => _finishEditing(context))
            ],
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => _discardEdit(context),
            ),
          ),
          body: Column(children: <Widget>[
            TextField(
              controller: _textController,
              minLines: 1,
              maxLines: 100,
              onChanged: (body) => _onBodyChanged(context, body),
            ),
            Center(
              child: Text(Strings.editor.showEveryDays),
            ),
            NextDuePad(
              onSelection: (days) => _onDueDaysChanged(context, days),
              currentValue: state.dueDays,
            ),
          ]));
    });
  }

  String _screenTitle(EditorState state) {
    return state.mode == EditorMode.add
        ? Strings.editor.screenNameAdd
        : Strings.editor.screenNameEdit;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

_showConfirmDiscardDialog(BuildContext context) {
  final EditorBloc bloc = BlocProvider.of<EditorBloc>(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(bloc.state.mode == EditorMode.add
              ? Strings.editor.confirmDiscardAddTitle
              : Strings.editor.confirmDiscardEditTitle),
          actions: [
            FlatButton(
              child: Text(Strings.editor.confirmDiscardConfirmAction),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
                bloc.add(FinishedEditingEvent());
              },
            ),
            FlatButton(
              child: Text(Strings.editor.confirmDiscardAbortAction),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
              },
            ),
          ],
        );
      });
}
