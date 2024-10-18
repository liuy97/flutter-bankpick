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
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(0x1e, 0x1e, 0x2d, 1.0),
          ),
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
              const Text(
                'Tanya Myroniuk',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(0x1e, 0x1e, 0x2d, 1.0),
                ),
              ),
              const Text(
                'Senior Designer',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(0xA2, 0xA2, 0xA7, 1.0),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      AppLocalizations.of(context)!.editProfileFullName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(0xA2, 0xA2, 0xA7, 100),
                      ),
                    ))
                  ])),
              const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(IconData(0xe910, fontFamily: 'icomoon'))),
                    Expanded(
                      child: Text(
                        'Tanya Myroniuk',
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
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(0xA2, 0xA2, 0xA7, 100),
                      ),
                    ))
                  ])),
              const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(IconData(0xe902, fontFamily: 'icomoon'))),
                    Expanded(
                      child: Text(
                        'Tanya Myroniuk@gmail.com',
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
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(0xA2, 0xA2, 0xA7, 100),
                      ),
                    ))
                  ])),
              const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(IconData(0xe906, fontFamily: 'icomoon'))),
                    Expanded(
                      child: Text(
                        '+8801712663389',
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
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(0xA2, 0xA2, 0xA7, 100),
                      ),
                    ))
                  ])),
              const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('28'),
                      Text('September'),
                      Text('2000')
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
