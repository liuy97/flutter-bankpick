import 'package:bankpick/provider/local_settings.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String language = ref.watch(LocalSettings.languageProvider);
    const List<String> flags = ['CN', 'US'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.languageTitle,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Column(
            children: [
              const Gap(32),
              SearchBar(
                  shadowColor: const WidgetStatePropertyAll(Colors.transparent),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  hintText: 'Search language',
                  leading: const Icon(IconData(0xe919, fontFamily: 'icomoon'))),
              const Gap(32),
              Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: flags.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              if (language != flags[index]) {
                                ref
                                    .read(
                                        LocalSettings.languageProvider.notifier)
                                    .set(flags[index]);
                              }
                            },
                            child: buildCountryFlag(
                                flags[index], language == flags[index]));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider()))
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCountryFlag(String countryCode, bool isSelected) => FlagItem(
    flag: CountryFlag.fromCountryCode(
      shape: const Circle(),
      countryCode,
      width: 48,
      height: 48,
    ),
    countryCode: countryCode,
    isSelected: isSelected);

class FlagItem extends StatelessWidget {
  const FlagItem({
    super.key,
    required this.flag,
    required this.countryCode,
    required this.isSelected,
  });

  final CountryFlag flag;
  final String countryCode;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        flag,
        const SizedBox(width: 16),
        Text(
          countryCode == 'CN'
              ? AppLocalizations.of(context)!.languageChinese
              : AppLocalizations.of(context)!.languageEnglish,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        isSelected
            ? Icon(
                const IconData(0xe915, fontFamily: 'icomoon'),
                size: 24,
                color: Theme.of(context).primaryColor,
              )
            : const SizedBox(width: 24)
      ],
    );
  }
}
