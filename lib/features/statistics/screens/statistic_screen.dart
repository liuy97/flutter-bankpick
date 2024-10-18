import 'package:flutter/material.dart';

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
        const Padding(padding: EdgeInsets.all(16), child: BalanceChartWidget()),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              const Expanded(
                  child: Text('Transaction',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18))),
              TextButton(
                  onPressed: () {},
                  child: const Text('Sell All', style: TextStyle(fontSize: 14)))
            ])),
        const Expanded(child: EntriesWidget())
      ])),
    );
  }
}
