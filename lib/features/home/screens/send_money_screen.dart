import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.sendMoneyTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                  CreditCardWidget(
                    width: MediaQuery.of(context).size.width,
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
                  const SizedBox(height: 20),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffE7EAEE)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.sendMoneySendTo,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: const Color(0xff7E848D))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SeparatedRow(
                            separatorBuilder: () => const Gap(18),
                            children: [
                              Column(children: [
                                const CircleAvatar(
                                    child: const Icon(IconData(0xe917,
                                        fontFamily: 'icomoon'))),
                                Text('Add',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 11))
                              ]),
                              Column(children: [
                                CircleAvatar(
                                    child: Image.asset(
                                  'assets/images/profile.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                )),
                                Text('Yamilet',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 11))
                              ]),
                              Column(children: [
                                CircleAvatar(
                                    child: Image.asset(
                                  'assets/images/profile.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                )),
                                Text('Alexa',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 11))
                              ]),
                              Column(children: [
                                CircleAvatar(
                                    child: Image.asset(
                                  'assets/images/profile.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                )),
                                Text('Yakub',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 11))
                              ]),
                              Column(children: [
                                CircleAvatar(
                                    child: Image.asset(
                                  'assets/images/profile.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                )),
                                Text('Krishna',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 11))
                              ]),
                            ])
                      ])),
                  const SizedBox(height: 20),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffE7EAEE)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .sendMoneyEnterYourAmount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Color(0xff7E848D)))),
                            Text(
                                AppLocalizations.of(context)!
                                    .sendMoneyChangeCurrency,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Color(0xffFF3F60)))
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(children: [
                          Text('USD ',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff9BB2D4))),
                          Text(
                            '36.00',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ])
                      ]))
                ]))),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    child: Text(AppLocalizations.of(context)!.sendMoneyButton,
                        style: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                )),
              ],
            )
          ]),
        ));
  }
}
