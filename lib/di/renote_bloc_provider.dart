import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renote/auth/auth_bloc.dart';
import 'package:renote/auth/auth_event.dart';
import 'package:renote/auth/user_repository.dart';
import 'package:renote/data/note/firebase_note_repository.dart';
import 'package:renote/search/search_bloc.dart';

class RenoteBlocProvider extends StatelessWidget {
  final Widget child;

  const RenoteBlocProvider({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(FirebaseNoteRepository()),
        ),
        BlocProvider(
            create: (context) =>
                AuthBloc(userRepository: UserRepository())..add(AppStarted())),
      ],
      child: child,
    );
  }
}
