import '../../../features/statistics/models/statistics_entry.dart';
import '../api_client.dart';

part 'mocked_api_client_repository.dart';

class MockedApiClient implements ApiClient {
  final Duration _delay;

  final List<StatisticEntry> _statisticEntries =
      _MockedApiClientRepository.getStatisticEntries();

  MockedApiClient({Duration? delay})
      : _delay = delay ?? const Duration(milliseconds: 500);

  MockedApiClient.withToken(String token, {Duration? delay})
      : _delay = delay ?? const Duration(milliseconds: 500);

  @override
  Future<List<StatisticEntry>> fetchStatisticEntries() async {
    await Future.delayed(_delay);
    return _statisticEntries;
  }

  @override
  Future<List<StatisticEntry>> search(String term) async {
    await Future.delayed(_delay);
    return _statisticEntries
        .where((entry) =>
            entry.brand.toLowerCase().contains(term) ||
            entry.category.toLowerCase().contains(term))
        .toList();
  }
}

extension on String {
  /// Checks if this contains [query], case-insensitively.
  bool find(String query) => toLowerCase().contains(query.toLowerCase());
}
