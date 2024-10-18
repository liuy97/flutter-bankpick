import 'package:bankpick/services/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/api/api_client.dart';
import '../../statistics/models/statistics_entry.dart';

part 'search_provider.freezed.dart';

@freezed
abstract class EntryState with _$EntryState {
  const factory EntryState({
    @Default(1) int page,
    @Default([]) List<StatisticEntry> entries,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadMoreError,
    @Default(false) bool isLoadMoreDone,
  }) = _EntryState;

  const EntryState._();
}

final entriesProvider = StateNotifierProvider<EntryNotifier, EntryState>((ref) {
  return EntryNotifier(ref.read(apiServiceProvider));
});

class EntryNotifier extends StateNotifier<EntryState> {
  ApiClient api;
  EntryNotifier(this.api) : super(const EntryState()) {
    _initPosts();
  }

  _initPosts([int? initPage]) async {
    final page = initPage ?? state.page;
    final entries = await api.search(page as String);

    if (entries == null) {
      state = state.copyWith(page: page, isLoading: false);
      return;
    }

    print('get post is ${entries.length}');
    state = state.copyWith(page: page, isLoading: false, entries: entries);
  }

  loadMorePost() async {
    StringBuffer bf = StringBuffer();

    bf.write('try to request loading ${state.isLoading} at ${state.page + 1}');
    if (state.isLoading) {
      bf.write(' fail');
      return;
    }
    bf.write(' success');
    print(bf.toString());
    state = state.copyWith(
        isLoading: true, isLoadMoreDone: false, isLoadMoreError: false);

    final posts = await api.search((state.page + 1) as String);

    if (posts == null) {
      // error
      state = state.copyWith(isLoadMoreError: true, isLoading: false);
      return;
    }

    print('load more ${posts.length} posts at page ${state.page + 1}');
    if (posts.isNotEmpty) {
      // if load more return a list not empty, => increment page
      state = state.copyWith(
          page: state.page + 1,
          isLoading: false,
          isLoadMoreDone: posts.isEmpty,
          entries: [...state.entries, ...posts]);
    } else {
      // not increment page
      state = state.copyWith(
        isLoading: false,
        isLoadMoreDone: posts.isEmpty,
      );
    }
  }

  Future<void> refresh() async {
    _initPosts(1);
  }
}

final keyProvider = StateProvider<String>((ref) {
  return '';
});

// final entrySearchProvider = StateProvider<List<StatisticEntry>>((ref) {
//   final postState = ref.watch(entriesProvider);
//   final key = ref.watch(keyProvider);

//   return postState.entries
//       ?.where((element) =>
//           element.body.contains(key) || element.title.contains(key))
//       ?.toList();
// });
