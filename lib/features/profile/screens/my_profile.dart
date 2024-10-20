import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.myProfileTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          MaterialButton(
              elevation: 0,
              color: const Color(0xfff4f4f4),
              textColor: Colors.black,
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder(),
              child: const Icon(IconData(0xe911, fontFamily: 'icomoon')),
              onPressed: () {
                GoRouter.of(context).go('/profile/myProfile/editProfile');
              })
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              child: Column(
                children: [
                  Row(children: [
                    Column(children: [
                      Image.asset(
                        'assets/images/profile.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                    ]),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tanya Myroniuk',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 17)),
                                  Text(
                                    'Senior Designer',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ])))
                  ]),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/personalInformation/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                    IconData(0xe910, fontFamily: 'icomoon'),
                                    color: Color(0xffa2a2a7))),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .myProfilePersonalInformation,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/paymentPreferences/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                    IconData(0xe90f, fontFamily: 'icomoon'),
                                    color: Color(0xffa2a2a7))),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .myProfilePaymentPreferences,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/banksAndCards/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                    IconData(0xe90e, fontFamily: 'icomoon'),
                                    color: Color(0xffa2a2a7))),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .myProfileBanksAndCards,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/notifications/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                    IconData(0xe90d, fontFamily: 'icomoon'),
                                    color: Color(0xffa2a2a7))),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .myProfileNotifications,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/messageCenter/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                  IconData(0xe90c, fontFamily: 'icomoon'),
                                  color: Color(0xffa2a2a7),
                                )),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .myProfileMessageCenter,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/address/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                    IconData(0xe90b, fontFamily: 'icomoon'),
                                    color: Color(0xffa2a2a7))),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.myProfileAddress,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).go('/settings/settings/');
                      },
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Row(children: [
                            const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                    IconData(0xe901, fontFamily: 'icomoon'),
                                    color: Color(0xffa2a2a7))),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.myProfileSettings,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const Icon(Icons.chevron_right)
                          ]))),
                  const Divider(),
                ],
              )),
        ),
      ),
    );
  }
}
