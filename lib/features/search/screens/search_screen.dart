import 'package:flutter/material.dart';

import '../../../services/api/api_client.dart';
import '../provider/search_bloc.dart';
import '../provider/search_state.dart';
import '../widgets/empty_result_widget.dart';
import '../widgets/search_error_widget.dart';
import '../widgets/search_intro_widget.dart';
import '../widgets/search_loading_widget.dart';
import '../widgets/search_result_widget.dart';

// The View in a Stream-based architecture takes two arguments: The State Stream
// and the onTextChanged callback. In our case, the onTextChanged callback will
// emit the latest String to a Stream<String> whenever it is called.
//
// The State will use the Stream<String> to send new search requests to the
// GithubApi.
class SearchScreen extends StatefulWidget {
  final ApiClient api;

  const SearchScreen({super.key, required this.api});

  @override
  SearchScreenState createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  late final SearchBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = SearchBloc(widget.api);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchState>(
      stream: bloc.state,
      initialData: bloc.state.value,
      builder: (BuildContext context, AsyncSnapshot<SearchState> snapshot) {
        final state = snapshot.requireData;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: _buildSearchBar(),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildChild(state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.search,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.search,
              style: const TextStyle(
                fontSize: 18.0,
                decoration: TextDecoration.none,
              ),
              decoration: const InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: 'Search ...',
              ),
              onChanged: bloc.onTextChanged.add,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChild(SearchState state) {
    return switch (state) {
      SearchNoTerm() => const SearchIntro(),
      SearchEmpty() => const EmptyWidget(),
      SearchLoading() => const LoadingWidget(),
      SearchError() => const SearchErrorWidget(),
      SearchPopulated() => SearchResultWidget(items: state.result)
    };
  }
}
