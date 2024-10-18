import 'package:dio/dio.dart';

import '../../features/statistics/models/statistics_entry.dart';

typedef ApiClientException = DioException;
typedef ApiClientResponse<T> = Response<T>;
typedef ApiClientRequestOptions = RequestOptions;
typedef _ResponseData = Map<String, Object?>;

extension ApiClientExceptionX on ApiClientException {
  String? get responseMessage => response?.data?['message'] as String?;
}

class ApiClient {
  static final BaseOptions _defaultOptions = BaseOptions(
    baseUrl: 'https://dummyjson.com',
  );

  final Dio _httpClient;

  /// Creates an [ApiClient] with default options.
  ApiClient() : _httpClient = Dio(_defaultOptions);

  /// Creates an [ApiClient] with [token] set for authorization.
  ApiClient.withToken(String token)
      : _httpClient = Dio(
          _defaultOptions.copyWith()
            ..headers['Authorization'] = 'Bearer $token',
        );

  @override
  String toString() {
    return "ApiClient(_httpClient.options.headers['Authorization']: ${_httpClient.options.headers['Authorization']})";
  }

  Future<List<StatisticEntry>> fetchStatisticEntries() async {
    final response = await _httpClient.get('/statistic-entries');

    return (response.data['entries'] as List)
        .cast<_ResponseData>()
        .map(StatisticEntry.fromJson)
        .toList();
  }

  Future<List<StatisticEntry>> search(String term) async {
    final response = await _httpClient.get('/search');

    return (response.data['entries'] as List)
        .cast<_ResponseData>()
        .map(StatisticEntry.fromJson)
        .toList();
  }
}
