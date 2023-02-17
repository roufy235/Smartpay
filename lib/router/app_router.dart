import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartpay/app/auth/presentation/pages/forgot_password_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/login_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/new_password_screen.dart';
import 'package:smartpay/app/auth/presentation/pages/verify_identity_screen.dart';
import 'package:smartpay/app/on_boarding/presentation/pages/on_boarding_screen.dart';
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
        path: '/${AppScreens.loginScreen.toPath}',
        name: AppScreens.loginScreen.toName,
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
        routes: [
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
    ]
  );

}
