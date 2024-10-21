import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../statistics/widgets/entries_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Column(children: [
                  CircleAvatar(
                      child: Image.asset(
                    'assets/images/profile.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.fitHeight,
                  )),
                ]),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .homeScreenWelcomeBack,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: const Color(0xff7e848d),
                                    ),
                              ),
                              Text(
                                'Tanya Myroniuk',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ]))),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    GoRouter.of(context).go('/home/search');
                  },
                  color: const Color(0xfff4f4f4),
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: const Icon(
                    IconData(0xe919, fontFamily: 'icomoon'),
                    size: 24,
                  ),
                ),
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CreditCardWidget(
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
              )),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          GoRouter.of(context).go('/home/send-money');
                        },
                        color: const Color(0xfff4f4f4),
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                        shape: const CircleBorder(),
                        child: const Icon(
                          IconData(0xe90a, fontFamily: 'icomoon'),
                          size: 24,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.homeScreenSend,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 13,
                                  ))
                    ]),
                    Column(children: [
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          GoRouter.of(context).go('/home/request-money/');
                        },
                        color: const Color(0xfff4f4f4),
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                        shape: const CircleBorder(),
                        child: const Icon(
                          IconData(0xe908, fontFamily: 'icomoon'),
                          size: 24,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.homeScreenReceive,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 13,
                                  ))
                    ]),
                    Column(children: [
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          GoRouter.of(context).go('/home/loan-money/');
                        },
                        color: const Color(0xfff4f4f4),
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                        shape: const CircleBorder(),
                        child: const Icon(
                          IconData(0xe909, fontFamily: 'icomoon'),
                          size: 24,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.homeScreenLoan,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 13,
                                  ))
                    ]),
                    Column(children: [
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          GoRouter.of(context).go('/home/top-up/');
                        },
                        color: const Color(0xfff4f4f4),
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                        shape: const CircleBorder(),
                        child: const Icon(
                          IconData(0xe916, fontFamily: 'icomoon'),
                          size: 24,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.homeScreenTopUp,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 13,
                                  ))
                    ])
                  ])),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Expanded(
                    child: Text(
                        AppLocalizations.of(context)!
                            .statisticScreenTransaction,
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
        ],
      ),
    ));
  }
}
