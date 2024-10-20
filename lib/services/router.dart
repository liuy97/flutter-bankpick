import 'package:bankpick/features/home/screens/loan_money_screen.dart';
import 'package:bankpick/features/home/screens/top_up_screen.dart';
import 'package:bankpick/features/login/screens/sign_up_screen.dart';
import 'package:bankpick/services/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../features/onboarding/screens/onboarding_screen.dart';
import '../provider/local_settings.dart';
import '../features/my_cards/screens/add_new_card_screen.dart';
import '../features/my_cards/screens/all_cards_screen.dart';
import '../features/login/screens/login_screen.dart';
import '../provider/firebase_auth_repository.dart';
import '../features/home/screens/request_money_screen.dart';
import '../features/home/screens/send_money_screen.dart';
import '../features/search/screens/search_screen.dart';
import '../features/profile/screens/change_password_screen.dart';
import '../features/profile/screens/contact_us.dart';
import '../features/profile/screens/edit_profile.dart';
import '../features/profile/screens/language_screen.dart';
import '../features/profile/screens/my_profile.dart';
import '../features/profile/screens/privacy_policy.dart';
import '../features/profile/screens/settings_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/my_cards/screens/my_cards_screen.dart';
import '../features/statistics/screens/statistic_screen.dart';
import '../provider/auth_state.dart';

part 'router.g.dart';

/// The router config for the app.
@riverpod
GoRouter router(RouterRef ref) {
  // Local notifier for the current auth state. The purpose of this notifier is

  // This is the only place you need to define your navigation items. The items
  // will be propagated automatically to the router and the navigation bar/rail
  // of the scaffold.

  // see [AuthState] enum.
  final navigationItems = [
    NavigationItem(
      path: '/home',
      body: (_) => HomeScreen(),
      icon: const IconData(0xe905, fontFamily: 'icomoon'),
      selectedIcon: const IconData(0xe905, fontFamily: 'icomoon'),
      label: 'Home',
      routes: [
        GoRoute(
          path: 'search',
          builder: (context, state) {
            return Builder(builder: (context) {
              return SearchScreen(api: ref.read(apiServiceProvider));
            });
          },
        ),
        GoRoute(
          path: 'send-money',
          builder: (_, state) {
            return Builder(builder: (context) {
              return const SendMoneyScreen();
            });
          },
        ),
        GoRoute(
          path: 'request-money',
          builder: (_, state) {
            return Builder(builder: (context) {
              return const RequestMoneyScreen();
            });
          },
        ),
        GoRoute(
          path: 'loan-money',
          builder: (_, state) {
            return Builder(builder: (context) {
              return const LoanMoneyScreen();
            });
          },
        ),
        GoRoute(
          path: 'top-up',
          builder: (_, state) {
            return Builder(builder: (context) {
              return const TopUpScreen();
            });
          },
        ),
      ],
    ),
    NavigationItem(
      path: '/my-cards',
      body: (_) => MyCardsScreen(),
      icon: const IconData(0xe900, fontFamily: 'icomoon'),
      selectedIcon: const IconData(0xe900, fontFamily: 'icomoon'),
      label: 'MyCards',
      routes: [
        GoRoute(
            path: 'all-cards',
            builder: (_, state) {
              return const AllCardsScreen();
            },
            routes: [
              GoRoute(
                path: 'add',
                builder: (_, __) => const AddNewCardScreen(),
              ),
            ]),
      ],
    ),
    NavigationItem(
      path: '/statistic',
      body: (_) => const StatisticScreen(),
      icon: const IconData(0xe907, fontFamily: 'icomoon'),
      selectedIcon: const IconData(0xe907, fontFamily: 'icomoon'),
      label: 'Statistics',
    ),
    NavigationItem(
        path: '/profile',
        body: (_) => const SettingsScreen(),
        icon: const IconData(0xe901, fontFamily: 'icomoon'),
        selectedIcon: const IconData(0xe901, fontFamily: 'icomoon'),
        label: 'Profile',
        routes: [
          GoRoute(
            path: 'language',
            builder: (context, state) {
              return Builder(builder: (context) {
                return LanguageScreen();
              });
            },
          ),
          GoRoute(
              path: 'myProfile',
              builder: (context, state) {
                return Builder(builder: (context) {
                  return const MyProfile();
                });
              },
              routes: [
                GoRoute(
                  path: 'editProfile',
                  builder: (context, state) {
                    return Builder(builder: (context) {
                      return const EditProfile();
                    });
                  },
                )
              ]),
          GoRoute(
            path: 'contactUs',
            builder: (context, state) {
              return Builder(builder: (context) {
                return const ContactUs();
              });
            },
          ),
          GoRoute(
            path: 'changePassword',
            builder: (context, state) {
              return Builder(builder: (context) {
                return ChangePasswordScreen();
              });
            },
          ),
          GoRoute(
            path: 'privacyPolicy',
            builder: (context, state) {
              return Builder(builder: (context) {
                return const PrivacyPolicy();
              });
            },
          )
        ]),
  ];

  final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: navigationItems.first.path,
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const Scaffold(),
        ),
        GoRoute(
          path: '/login',
          builder: (_, __) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (_, __) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/onboarding',
          builder: (_, __) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (_, __) => const SettingsScreen(),
        ),

        // Configuration for the bottom navigation bar routes. The routes themselves
        // should be defined in [navigationItems]. Modification to this [ShellRoute]
        // config is rarely needed.
        ShellRoute(
          builder: (_, __, child) => child,
          routes: [
            for (final (index, item) in navigationItems.indexed)
              GoRoute(
                path: item.path,
                pageBuilder: (context, _) => NoTransitionPage(
                  child: ScaffoldWithNavigation(
                    selectedIndex: index,
                    navigationItems: navigationItems,
                    child: item.body(context),
                  ),
                ),
                routes: item.routes,
              ),
          ],
        ),
      ],
      refreshListenable: ref.read(authStateNotifierProvider),
      redirect: (context, state) {
        // Get the current auth state.
        /* if (appStartupState.isLoading || appStartupState.hasError) {
        return '/startup';
      } */
        final isOnboardingComplete =
            ref.read(LocalSettings.onboardingCompleteProvider);
        final path = state.uri.path;
        if (!isOnboardingComplete) {
          if (path != '/onboarding') {
            return '/onboarding';
          }
          return null;
        }

        final authService = ref.read(authRepositoryProvider);
        final authState = authService.currentUser != null
            ? AuthState.authenticated
            : AuthState.unauthenticated;

        if (!authState.allowedPaths.contains(state.fullPath)) {
          return authState.redirectPath;
        }
        return null;
      });
  ref.onDispose(router.dispose);

  return router;
}

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.navigationItems,
  });

  final Widget child;
  final int selectedIndex;
  final List<NavigationItem> navigationItems;

  @override
  Widget build(BuildContext context) {
    void onDestinationSelected(int index) =>
        context.go(navigationItems[index].path);
    final labels = {
      'Home': AppLocalizations.of(context)!.tabsHome,
      'MyCards': AppLocalizations.of(context)!.tabsMyCards,
      'Statistics': AppLocalizations.of(context)!.tabsStatistics,
      'Profile': AppLocalizations.of(context)!.tabsSettings,
    };

    // Use navigation rail instead of navigation bar when the screen width is
    // larger than 600dp.
    if (MediaQuery.sizeOf(context).width > 600) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              destinations: [
                for (final item in navigationItems)
                  NavigationRailDestination(
                    icon: Icon(item.icon),
                    selectedIcon: item.selectedIcon != null
                        ? Icon(item.selectedIcon)
                        : null,
                    label: Text(labels[item.label]!),
                  )
              ],
              extended: true,
            ),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          for (final item in navigationItems)
            NavigationDestination(
              icon: Icon(item.icon),
              selectedIcon:
                  item.selectedIcon != null ? Icon(item.selectedIcon) : null,
              label: (labels[item.label]!),
            )
        ],
      ),
    );
  }
}

/// An item that represents a navigation destination in a navigation bar/rail.
class NavigationItem {
  /// Path in the router.
  final String path;

  /// Widget to show when navigating to this [path].
  final WidgetBuilder body;

  /// Icon in the navigation bar.
  final IconData icon;

  /// Icon in the navigation bar when selected.
  final IconData? selectedIcon;

  /// Label in the navigation bar.
  final String label;

  /// The subroutes of the route from this [path].
  final List<RouteBase> routes;

  NavigationItem({
    required this.path,
    required this.body,
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.routes = const [],
  });
}
