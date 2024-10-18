import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_entry.freezed.dart';
part 'statistics_entry.g.dart';

@freezed
class StatisticEntry with _$StatisticEntry {
  const factory StatisticEntry({
    required int id,
    required String brand,
    required String category,
    required String font,
    required double amount,
    required bool incoming,
  }) = _StatisticEntry;

  const StatisticEntry._();

  factory StatisticEntry.fromJson(Map<String, Object?> json) =>
      _$StatisticEntryFromJson(json);
}
