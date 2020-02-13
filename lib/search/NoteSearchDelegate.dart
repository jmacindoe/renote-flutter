import 'package:flutter/material.dart';
import 'package:renote/model/Note.dart';
import 'package:renote/search/SearchBloc.dart';
import 'package:renote/search/SearchEvent.dart';
import 'package:renote/search/SearchState.dart';

class NoteSearchDelegate extends SearchDelegate<Note> {
  final SearchBloc searchBloc;

  NoteSearchDelegate(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    searchBloc.add(SearchQueryUpdated(query));

    return StreamBuilder<SearchState>(
        stream: searchBloc,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // TODO
            return Text("Error");
          } else if (!snapshot.hasData) {
            // TODO: loading state
            return Column();
          } else if (snapshot.data.results.length == 0) {
            // TODO: empty state
            return Text("No results");
          } else {
            final results = snapshot.data.results;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return ListTile(
                  title: Text(result.body),
                  onTap: () => close(context, result),
                );
              },
            );
          }
        });
  }
}
