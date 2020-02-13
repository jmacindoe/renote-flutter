import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renote/data/note/models/note.dart';
import 'package:renote/editor/editor_bloc.dart';
import 'package:renote/editor/internal_editor.dart';

class Editor extends StatelessWidget {
  final Note note;

  const Editor({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc(note),
      child: InternalEditor(),
    );
  }
}
