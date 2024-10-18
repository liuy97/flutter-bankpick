import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../../provider/local_settings.dart';
import '../widgets/onboarding_2.dart';
import '../widgets/onboarding_3.dart';
import '../widgets/onboarding_1.dart';
import '../widgets/splash_view.dart';
import '../widgets/top_back_skip_view.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      OnboardingScreenState();
}

class OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            OnBoarding1View(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
            OnBoarding2View(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
            OnBoarding3View(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
          ],
        ),
      )),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.6,
        duration: const Duration(milliseconds: 600));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.4);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 1.0) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    while (GoRouter.of(context).canPop() == true) {
      GoRouter.of(context).pop();
    }
    final onboardingComplete =
        ref.read(LocalSettings.onboardingCompleteProvider);
    if (!onboardingComplete) {
      ref.read(LocalSettings.onboardingCompleteProvider.notifier).set(true);
      GoRouter.of(context).go('/login');
    }
  }
}
