import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../provider/shared_preferences_provider.dart';
import 'api_client.dart';
import 'mock/mocked_api_client.dart';

part 'api_service.g.dart';

@riverpod
ApiClient apiService(ApiServiceRef ref) {
  final token = ref.watch(tokenProvider);

  final ApiClient client;

  const mock = bool.fromEnvironment('MOCK_API', defaultValue: true);
  client = switch (mock) {
    true =>
      token != null ? MockedApiClient.withToken(token) : MockedApiClient(),
    false => token != null ? ApiClient.withToken(token) : ApiClient(),
  };
  ref.keepAlive();

  return client;
}

@riverpod
String? token(TokenRef ref) {
  final secureStorage = ref.watch(sharedPreferencesProvider);
  return secureStorage.get('token', null);
}
