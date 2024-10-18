import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../provider/firebase_auth_repository.dart';
import '../../../provider/local_settings.dart';
import 'theme_mode_list_tile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  final bool enabledBiometric = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: Text(AppLocalizations.of(context)!.settingsTitle,
              style: const TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              onPressed: () async {
                await ref.read(firebaseAuthProvider).signOut();
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xfff4f4f4),
                iconColor: Colors.black,
                padding: const EdgeInsets.all(11),
                shape: const CircleBorder(),
              ),
              child: const Icon(
                IconData(0xe913, fontFamily: 'icomoon'),
                size: 24,
              ),
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 10.0),
                            child: Row(children: [
                              Expanded(
                                  child: Text(
                                AppLocalizations.of(context)!.settingsGeneral,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffA2A2A7),
                                ),
                              ))
                            ])),
                        GestureDetector(
                            onTap: () {
                              GoRouter.of(context).go('/profile/language/');
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 22.0, bottom: 10.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .settingsLanguage,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        )),
                                  ),
                                  Text(
                                    ref.watch(LocalSettings.languageProvider) ==
                                            'CN'
                                        ? AppLocalizations.of(context)!
                                            .languageChinese
                                        : AppLocalizations.of(context)!
                                            .languageEnglish,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Icon(
                                    IconData(0xe912, fontFamily: 'icomoon'),
                                    size: 24,
                                    color: Color(0xff7E848D),
                                  )
                                ]))),
                        const Divider(),
                        GestureDetector(
                            onTap: () {
                              GoRouter.of(context).go('/profile/myProfile/');
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 22.0, bottom: 10.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .settingsMyProfile,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    IconData(0xe912, fontFamily: 'icomoon'),
                                    size: 24,
                                    color: Color(0xff7E848D),
                                  )
                                ]))),
                        const Divider(),
                        GestureDetector(
                            onTap: () {
                              GoRouter.of(context).go('/profile/contactUs/');
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 22.0, bottom: 10.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .settingsContactUs,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    IconData(0xe912, fontFamily: 'icomoon'),
                                    size: 24,
                                    color: Color(0xff7E848D),
                                  )
                                ]))),
                        const Divider(),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 10.0),
                            child: Row(children: [
                              Expanded(
                                  child: Text(
                                AppLocalizations.of(context)!.settingsSecurity,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(0xA2, 0xA2, 0xA7, 100),
                                ),
                              ))
                            ])),
                        GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .go('/profile/changePassword/');
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 22.0, bottom: 10.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .settingsChangePassword,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    IconData(0xe912, fontFamily: 'icomoon'),
                                    size: 24,
                                    color: Color(0xff7E848D),
                                  )
                                ]))),
                        const Divider(),
                        GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .go('/profile/privacyPolicy/');
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 22.0, bottom: 10.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .settingsPrivacyPolicy,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    IconData(0xe912, fontFamily: 'icomoon'),
                                    size: 24,
                                    color: Color(0xff7E848D),
                                  )
                                ]))),
                        const Divider(),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .settingsPrivacyDescription,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ])),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .settingsBiometric,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Switch(
                                value: enabledBiometric,
                                onChanged: (bool value) {
                                  //
                                },
                              )
                            ])),
                        ThemeModeListTile(
                            title: Text(AppLocalizations.of(context)!
                                .settingsDarkMode)),
                      ],
                    )))));
  }
}
