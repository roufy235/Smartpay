import 'package:smartpay/router/router.dart';

extension AppScreensExtension on AppScreens {
  String get toPath {
    switch (this) {
      case AppScreens.onboarding: return 'onboarding';
      case AppScreens.loginScreen: return 'loginScreen';
      case AppScreens.forgotPasswordScreen: return 'forgotPasswordScreen';
      case AppScreens.verifyIdentityScreen: return 'verifyIdentityScreen';
      case AppScreens.newPasswordScreen: return 'newPasswordScreen';
    }
  }

  String get toName {
    switch (this) {
      case AppScreens.onboarding: return 'onboarding';
      case AppScreens.loginScreen: return 'loginScreen';
      case AppScreens.forgotPasswordScreen: return 'forgotPasswordScreen';
      case AppScreens.verifyIdentityScreen: return 'verifyIdentityScreen';
      case AppScreens.newPasswordScreen: return 'newPasswordScreen';
    }
  }
}
