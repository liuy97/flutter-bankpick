import 'package:flutter/material.dart';

import '../models/statistics_entry.dart';

class EntryWidget extends StatelessWidget {
  final StatisticEntry entry;
  const EntryWidget({
    required this.entry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).splashColor,
              foregroundColor: Colors.black,
              child: const Icon(
                Icons.apple, // data[index].font,
                size: 24,
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.brand,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            entry.category,
                            style: const TextStyle(fontSize: 12),
                          )
                        ]))),
            Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${entry.amount}',
                  style: const TextStyle(fontSize: 16),
                ))
          ],
        ));
  }
}
