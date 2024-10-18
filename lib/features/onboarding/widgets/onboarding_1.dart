import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'build_dots.dart';

class OnBoarding1View extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;

  const OnBoarding1View(
      {super.key,
      required this.animationController,
      required this.onNextClick});

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final textAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final imageAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final relaxAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: SlideTransition(
                position: imageAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Image.asset(
                    "assets/images/1.png",
                    fit: BoxFit.contain,
                  ),
                ),
              )),
              SlideTransition(
                  position: relaxAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (int index) => buildDots(index: index, current: 0),
                    ),
                  )),
              SlideTransition(
                  position: relaxAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 16, bottom: 16),
                    child: Text(
                      AppLocalizations.of(context)!.onBoardingHeader1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                  )),
              SlideTransition(
                position: textAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 16, bottom: 16),
                  child: Text(
                      AppLocalizations.of(context)!.onBoardingDescription1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14.0)),
                ),
              ),
              SlideTransition(
                  position: relaxAnimation,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 32),
                      child: Row(children: [
                        Expanded(
                            child: FilledButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              )),
                          onPressed: onNextClick,
                          child: Text(
                            AppLocalizations.of(context)!.onBoardingNext,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ))
                      ]))),
            ],
          ),
        ),
      ),
    );
  }
}
