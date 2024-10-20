import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../statistics/providers/statistics_entry.dart';
import '../../statistics/widgets/entry_widget.dart';

class MyCardsScreen extends ConsumerStatefulWidget {
  const MyCardsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MyCardsScreenState();
}

class MyCardsScreenState extends ConsumerState<MyCardsScreen> {
  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(statisticEntriesProvider);
    Future<void> onRefresh() => ref.refresh(statisticEntriesProvider.future);
    double currentSliderValue = 8545;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.myCardsTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.credit_card),
                onPressed: () {
                  GoRouter.of(context).go('/my-cards/all-cards');
                }),
          ],
        ),
        body: SafeArea(
            child: Column(children: [
          CreditCardWidget(
            enableFloatingCard: true,
            cardNumber: '456112245957852',
            expiryDate: '2020-04',
            cardHolderName: 'AR Jonson',
            cvvCode: '698',
            bankName: 'Pick Bank',
            showBackView: false,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand) {},
          ),
          Expanded(
              child: entries.when(
                  data: (data) {
                    var entries = data.sublist(0, 3);
                    return ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return EntryWidget(entry: entries[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider());
                  },
                  error: (Object error, StackTrace stackTrace) {
                    return const SizedBox();
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Monthly spending limit',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18)),
              ])),
          Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).canvasColor,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Amount: 8,545.00',
                        style: TextStyle(fontSize: 13)),
                    Slider(
                        value: currentSliderValue,
                        max: 10000,
                        min: 0,
                        divisions: 5,
                        label: currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            currentSliderValue = value;
                          });
                        }),
                    const Row(children: [
                      Text('\$0', style: TextStyle(fontSize: 12)),
                      Expanded(child: Text('')),
                      Text('\$10 000', style: TextStyle(fontSize: 12)),
                    ])
                  ])),
        ])));
  }
}
