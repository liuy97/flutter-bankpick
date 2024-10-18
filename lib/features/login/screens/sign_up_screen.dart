import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../provider/firebase_auth_repository.dart';
import '../../../services/api/api_client.dart';
import '../../../utils/extensions.dart';
import '../widgets/progress-button-widget.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = useState(false);

    final usernameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final passwordController = useTextEditingController();

    Future<void> onLoginPressed() async {
      try {
        await ref.read(firebaseAuthProvider).signInAnonymously();
      } on ApiClientException catch (e) {
        if (!context.mounted) return;
        context.showTextSnackBar(e.responseMessage ?? 'Login failed');
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(50),
                  Text(
                    AppLocalizations.of(context)!.signUpTitle,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const Gap(40),
                  Text(
                    AppLocalizations.of(context)!.signUpFullName,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      fillColor: Colors.transparent,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      contentPadding: EdgeInsets.only(bottom: 10),
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 8, bottom: 10),
                          child: Icon(IconData(0xe910, fontFamily: 'icomoon'),
                              size: 22, color: Color(0xffA2A2A7))),
                      prefixIconConstraints: BoxConstraints(minWidth: 22),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(22),
                  Text(
                    AppLocalizations.of(context)!.signUpPhoneNumber,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xffA2A2A7)),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: phoneNumberController,
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
                          child: Icon(IconData(0xe906, fontFamily: 'icomoon'),
                              size: 22, color: Color(0xffA2A2A7))),
                      prefixIconConstraints: BoxConstraints(minWidth: 22),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(22),
                  Text(
                    AppLocalizations.of(context)!.signUpEmailAddress,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xffA2A2A7)),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: usernameController,
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
                          child: Icon(IconData(0xe902, fontFamily: 'icomoon'),
                              size: 22, color: Color(0xffA2A2A7))),
                      prefixIconConstraints: BoxConstraints(minWidth: 22),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(22),
                  Text(
                    AppLocalizations.of(context)!.signUpPassword,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xffA2A2A7)),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(top: 10),
                        fillColor: Colors.transparent,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.only(right: 8, bottom: 10),
                            child: Icon(IconData(0xe903, fontFamily: 'icomoon'),
                                size: 22, color: Color(0xffA2A2A7))),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 22),
                        suffixIcon: IconButton(
                          icon: Icon(
                              isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 22,
                              color: const Color(0xffA2A2A7)),
                          onPressed: () => isPasswordVisible.value =
                              !isPasswordVisible.value,
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(minWidth: 22, minHeight: 22)),
                    obscureText: !isPasswordVisible.value,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const Gap(40),
                  ProgressButtonWidget(
                    onPressed: onLoginPressed,
                    label: AppLocalizations.of(context)!.signUpButton,
                  ),
                  const Gap(10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      AppLocalizations.of(context)!.signUpHaveAccount,
                      style: const TextStyle(fontSize: 14),
                    ),
                    TextButton(
                      child: Text(AppLocalizations.of(context)!.signUpLogin,
                          style: const TextStyle(fontSize: 14)),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ])
                ],
              ))),
    );
  }
}
