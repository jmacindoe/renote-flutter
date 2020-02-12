import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renote/search/SearchBloc.dart';
import 'package:renote/search/SearchRepository.dart';

class RenoteBlocProvider extends StatelessWidget {
  final Widget child;

  const RenoteBlocProvider({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(SearchRepository()),
        )
      ],
      child: child,
    );
  }
}
