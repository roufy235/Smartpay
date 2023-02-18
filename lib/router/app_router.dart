import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartpay/app/auth/presentation/pages/account_info_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/confirmation_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/email_verification_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/forgot_password_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/login_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/new_password_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/set_pin_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/sign_up_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/verify_identity_screen.dart';
import 'package:smartpay/app/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/verify_pin_screen.dart';
import 'package:smartpay/app/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/resources/hive_repository.dart';
import 'package:smartpay/router/router.dart';

class AppRouter {
  final WidgetRef ref;
  GoRouter get router => _goRouter;
  AppRouter({required this.ref});


  CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }

  late final GoRouter _goRouter = GoRouter(
    initialLocation: '/${AppScreens.onboarding.toPath}',
    routes: [
      GoRoute(
        path: '/${AppScreens.onboarding.toPath}',
        name: AppScreens.onboarding.toName,
        builder: (BuildContext context, GoRouterState state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.verifyPinScreen.toPath}',
        name: AppScreens.verifyPinScreen.toName,
        builder: (BuildContext context, GoRouterState state) => const VerifyPinScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.dashboardScreen.toPath}',
        name: AppScreens.dashboardScreen.toName,
        builder: (BuildContext context, GoRouterState state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.setPinScreen.toPath}',
        name: AppScreens.setPinScreen.toName,
        builder: (BuildContext context, GoRouterState state) => const SetPinScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.confirmationScreen.toPath}',
        name: AppScreens.confirmationScreen.toName,
        builder: (BuildContext context, GoRouterState state) => const ConfirmationScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.loginScreen.toPath}',
        name: AppScreens.loginScreen.toName,
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: AppScreens.signUpScreen.toPath,
            name: AppScreens.signUpScreen.toName,
            builder: (BuildContext context, GoRouterState state) => const SignUpScreen(),
            routes: [
              GoRoute(
                path: AppScreens.emailVerificationScreen.toPath,
                name: AppScreens.emailVerificationScreen.toName,
                builder: (BuildContext context, GoRouterState state) => const EmailVerificationScreen(),
                routes: [
                  GoRoute(
                    path: AppScreens.accountInfoScreen.toPath,
                    name: AppScreens.accountInfoScreen.toName,
                    builder: (BuildContext context, GoRouterState state) => const AccountInfoScreen(),
                  ),
                ]
              ),
            ]
          ),
          GoRoute(
            path: AppScreens.forgotPasswordScreen.toPath,
            name: AppScreens.forgotPasswordScreen.toName,
            builder: (BuildContext context, GoRouterState state) => const ForgotPasswordScreen(),
            routes: [
              GoRoute(
                path: AppScreens.verifyIdentityScreen.toPath,
                name: AppScreens.verifyIdentityScreen.toName,
                builder: (BuildContext context, GoRouterState state) => const VerifyIdentityScreen(),
                routes: [
                  GoRoute(
                    path: AppScreens.newPasswordScreen.toPath,
                    name: AppScreens.newPasswordScreen.toName,
                    builder: (BuildContext context, GoRouterState state) => const NewPasswordScreen(),
                  ),
                ]
              ),
            ]
          ),
        ]
      ),
    ],
    redirect: (BuildContext ctx, GoRouterState state) {
      final HiveRepository hiveRepository = ref.read(hiveRepositoryProvider);
      String token = hiveRepository.getUserAuthToken();
      // onboard screen
      final onboardingLocation = _goRouter.namedLocation(AppScreens.onboarding.toPath);
      final isGoingOnboardingLocation = state.subloc == onboardingLocation.replaceAll('?', '');
      final verifyPinLocation = _goRouter.namedLocation(AppScreens.verifyPinScreen.toPath);
      if (isGoingOnboardingLocation && token.isNotEmpty) {
        return verifyPinLocation;
      }
      return null;
    }
  );

}
