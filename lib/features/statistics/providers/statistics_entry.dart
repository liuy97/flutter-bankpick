import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/api/api_service.dart';
import '../models/statistics_entry.dart';

part 'statistics_entry.g.dart';

@riverpod
Future<List<StatisticEntry>> statisticEntries(StatisticEntriesRef ref) =>
    ref.watch(apiServiceProvider).fetchStatisticEntries();
