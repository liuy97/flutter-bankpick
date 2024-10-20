import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.editProfileTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 70,
                height: 70,
                fit: BoxFit.fitHeight,
              ),
              Text(
                'Tanya Myroniuk',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 17),
              ),
              Text(
                'Senior Designer',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            AppLocalizations.of(context)!.editProfileFullName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color(0xffA2A2A7),
                                )))
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(IconData(0xe910, fontFamily: 'icomoon'),
                            color: Color(0xffa2a2a7))),
                    Expanded(
                      child: Text(
                        'Tanya Myroniuk',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ])),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      AppLocalizations.of(context)!.editProfileEmailAddress,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xffA2A2A7),
                          ),
                    ))
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(IconData(0xe902, fontFamily: 'icomoon'),
                            color: Color(0xffa2a2a7))),
                    Expanded(
                      child: Text(
                        'Tanya Myroniuk@gmail.com',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ])),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      AppLocalizations.of(context)!.editProfilePhoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xffA2A2A7),
                          ),
                    ))
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(IconData(0xe906, fontFamily: 'icomoon'),
                            color: Color(0xffa2a2a7))),
                    Expanded(
                      child: Text(
                        '+8801712663389',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ])),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      AppLocalizations.of(context)!.editProfileBirthDate,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xffA2A2A7),
                          ),
                    ))
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '28',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'September',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '2000',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                      //
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
