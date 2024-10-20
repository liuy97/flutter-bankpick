import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ChangePasswordScreenState();
}

class ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.changePasswordTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 16),
                    child: Row(children: [
                      Text(
                        AppLocalizations.of(context)!
                            .changePasswordCurrentPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xffA2A2A7)),
                      )
                    ])),
                TextFormField(
                  // controller: usernameController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 10),
                    fillColor: Colors.transparent,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 10),
                        child: Icon(IconData(0xe903, fontFamily: 'icomoon'),
                            color: Color(0xffa2a2a7), size: 22)),
                    prefixIconConstraints: BoxConstraints(minWidth: 22),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 16),
                    child: Row(children: [
                      Text(
                        AppLocalizations.of(context)!.changePasswordNewPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xffA2A2A7)),
                      )
                    ])),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 10),
                    fillColor: Colors.transparent,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 10),
                        child: Icon(IconData(0xe903, fontFamily: 'icomoon'),
                            size: 22, color: Color(0xffa2a2a7))),
                    prefixIconConstraints: BoxConstraints(minWidth: 22),
                    suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 10),
                        child: Icon(IconData(0xe904, fontFamily: 'icomoon'),
                            size: 22, color: Color(0xffa2a2a7))),
                    suffixIconConstraints: BoxConstraints(minWidth: 22),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 16),
                    child: Row(children: [
                      Text(
                        AppLocalizations.of(context)!
                            .changePasswordConfirmNewPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xffA2A2A7)),
                      )
                    ])),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 10),
                    fillColor: Colors.transparent,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 10),
                        child: Icon(IconData(0xe903, fontFamily: 'icomoon'),
                            size: 22, color: Color(0xffa2a2a7))),
                    prefixIconConstraints: BoxConstraints(minWidth: 22),
                    suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 10),
                        child: Icon(IconData(0xe904, fontFamily: 'icomoon'),
                            size: 22, color: Color(0xffa2a2a7))),
                    suffixIconConstraints: BoxConstraints(minWidth: 22),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(children: [
                      Text(
                        AppLocalizations.of(context)!
                            .changePasswordRequirements,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xffA2A2A7)),
                      )
                    ])),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: FilledButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            )),
                        child: Text(
                            AppLocalizations.of(context)!.changePasswordButton,
                            style: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {},
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
