part of 'mocked_api_client.dart';

typedef _ResponseData = Map<String, Object?>;

class _MockedApiClientRepository {
  _MockedApiClientRepository._();

  static List<StatisticEntry> getStatisticEntries() {
    final dynamic json = {
      "entries": [
        {
          "id": 1,
          "brand": "Apple Store",
          "category": "Entertainment",
          "amount": 5.99,
          "incoming": false,
          "font": "apple"
        },
        {
          "id": 2,
          "brand": "Spotify",
          "category": "Music",
          "amount": 12.99,
          "incoming": false,
          "font": "spotify"
        },
        {
          "id": 3,
          "brand": "Money Transfer",
          "category": "Transaction",
          "amount": 300,
          "incoming": true,
          "font": "money"
        },
        {
          "id": 4,
          "brand": "Grocery",
          "category": "Shopping",
          "amount": 88,
          "incoming": false,
          "font": "grocery"
        },
        {
          "id": 5,
          "brand": "Apple Store",
          "category": "Entertainment",
          "amount": 5.99,
          "incoming": false,
          "font": "apple"
        },
        {
          "id": 6,
          "brand": "Spotify",
          "category": "Music",
          "amount": 12.99,
          "incoming": false,
          "font": "spotify"
        },
        {
          "id": 7,
          "brand": "Money Transfer",
          "category": "Transaction",
          "amount": 300,
          "incoming": true,
          "font": "money"
        },
        {
          "id": 8,
          "brand": "Grocery",
          "category": "Shopping",
          "amount": 88,
          "incoming": false,
          "font": "grocery"
        },
      ]
    };
    return (json['entries'] as List)
        .cast<_ResponseData>()
        .map(StatisticEntry.fromJson)
        .toList();
  }
}
