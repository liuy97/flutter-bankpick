import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/statistics_entry.dart';
import 'entry_widget.dart';

class EntriesWidget extends ConsumerStatefulWidget {
  const EntriesWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EntriesWidgetState();
}

class EntriesWidgetState extends ConsumerState<EntriesWidget> {
  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(statisticEntriesProvider);
    Future<void> onRefresh() => ref.refresh(statisticEntriesProvider.future);

    return RefreshIndicator(
        onRefresh: onRefresh,
        child: entries.when(
            data: (data) => ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return EntryWidget(entry: data[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider()),
            error: (Object error, StackTrace stackTrace) {
              return const SizedBox();
            },
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
