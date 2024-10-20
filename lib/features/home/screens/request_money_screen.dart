import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RequestMoneyScreen extends StatelessWidget {
  const RequestMoneyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.requestMoneyTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .requestMoneyPayerName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: const Color(0xffA2A2A7)),
                              ),
                              Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(
                                        right: 16.0, top: 16, bottom: 10),
                                    child: Icon(
                                        IconData(0xe910, fontFamily: 'icomoon'),
                                        color: Color(0xffA2A2A7))),
                                Expanded(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .requestMoneyPersonalInformation,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ]),
                              Text(
                                AppLocalizations.of(context)!
                                    .requestMoneyEmailAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: const Color(0xffA2A2A7)),
                              ),
                              Row(children: [
                                const Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16.0, top: 16, bottom: 10),
                                    child: Icon(
                                        IconData(0xe902, fontFamily: 'icomoon'),
                                        color: Color(0xffA2A2A7))),
                                Expanded(
                                  child: Text(
                                    'Tanya Myroniuk@gmail.com',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ]),
                              Text(
                                AppLocalizations.of(context)!
                                    .requestMoneyDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: const Color(0xffA2A2A7)),
                              ),
                              Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(
                                        right: 16.0, top: 16, bottom: 10),
                                    child: Icon(
                                        IconData(0xe910, fontFamily: 'icomoon'),
                                        color: Color(0xffA2A2A7))),
                                Expanded(
                                  child: Text(
                                    'Tanya Myroniuk',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ]),
                              Text(
                                AppLocalizations.of(context)!
                                    .requestMoneyMonthlyDueBy,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: const Color(0xffA2A2A7)),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide())),
                                            child: Text('28',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                textAlign: TextAlign.center))),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide())),
                                            child: Text('09',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                textAlign: TextAlign.center))),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide())),
                                            child: Text('2024',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                textAlign: TextAlign.center))),
                                  ]),
                              const SizedBox(height: 20),
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffE7EAEE)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0))),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .requestMoneyEnterYourAmount,
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xff7E848D)))),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .requestMoneyChangeCurrency,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color: Color(0xffFF3F60)))
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
                                        '26.00.00',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])
                                  ]))
                            ])))),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    child: Text(
                        AppLocalizations.of(context)!.requestMoneyButton,
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
