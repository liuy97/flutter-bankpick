import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/balance_chart_widget.dart';
import '../widgets/entries_widget.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
            padding: const EdgeInsets.all(16),
            height: 400,
            child: const BalanceChartWidget()),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                  child: Text(
                      AppLocalizations.of(context)!.statisticScreenTransaction,
                      style: Theme.of(context).textTheme.titleMedium)),
              TextButton(
                  onPressed: () {},
                  child: Text(
                      AppLocalizations.of(context)!.statisticScreenSeeAll,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).primaryColor)))
            ])),
        const Expanded(child: EntriesWidget())
      ])),
    );
  }
}
