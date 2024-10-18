import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.privacyPolicyTitle,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(children: [
              Text(AppLocalizations.of(context)!.privacyPolicy1,
                  style: const TextStyle(
                    fontSize: 14,
                  )),
              Text(AppLocalizations.of(context)!.privacyPolicy2,
                  style: const TextStyle(
                    fontSize: 14,
                  )),
              Text(AppLocalizations.of(context)!.privacyPolicy3,
                  style: const TextStyle(
                    fontSize: 14,
                  )),
              Text(AppLocalizations.of(context)!.privacyPolicy4,
                  style: const TextStyle(
                    fontSize: 14,
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
