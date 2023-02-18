import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/auth/domain/entities/create_account_entity.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/entities/verify_email_token_entity.dart';
import 'package:smartpay/app/auth/presentation/providers/common.dart';
import 'package:smartpay/app/auth/presentation/providers/freezed/create_account_state.dart';

class CreateAccountController extends StateNotifier<CreateAccountState> {
  final Ref _ref;
  CreateAccountController(this._ref): super(const CreateAccountState());

  void updateSelectedCountryName({required String countryName, required String countryCode}) => state = state.copyWith(selectedCountry: countryName, selectedCountryCode: countryCode);

  set updatePasswordVisibility (bool value) {
    state = state.copyWith(
        isPasswordVisible : value
    );
  }

  Future<bool> register({required String firstName, required String username, required String password}) async {
    state = state.copyWith(isSignUpBtnLoading: true, errorStr: '');
    final CreateAccountEntity response = await _ref.read(createAccountUseCaseProvider).call(
        fullName: firstName,
        username: username,
        email: state.email,
        country: state.selectedCountryCode,
        password: password,
        deviceName: 'web'
    );
    state = state.copyWith(isSignUpBtnLoading: false, errorStr: '');
    if (response.status != null && response.status!) {
      return true;
    } else {
      if (response.errors != null) {
        if (response.errors!.password != null && response.errors!.password!.isNotEmpty) {
          state = state.copyWith(errorStr: response.errors!.password![0].toString());
        } else if (response.errors!.email != null && response.errors!.email!.isNotEmpty) {
          state = state.copyWith(errorStr: response.errors!.email![0].toString());
        } else {
          state = state.copyWith(errorStr: response.message.toString());
        }
      } else {
        state = state.copyWith(errorStr: response.message.toString());
      }
    }
    return false;
}

  Future<bool> verifyEmailToken({required String token}) async {
    if (token.isNotEmpty) {
      state = state.copyWith(emailVerBtnLoading: true, errorStr: '');
      VerifyEmailTokenEntity response = await _ref.read(verifyEmailUseCaseProvider).call(
          email: state.email,
          token: token
      );
      state = state.copyWith(emailVerBtnLoading: false, errorStr: '');
      if (response.status != null && response.status!) {
        return true;
      } else {
        state = state.copyWith(errorStr: response.message.toString());
      }
    } else {
      state = state.copyWith(errorStr: 'token is empty');
    }
    return false;
  }



  Future<bool> getEmailToken({required String email}) async {
    if (email.isNotEmpty) {
      state = state.copyWith(isBtnLoading: true, errorStr: '');
      GetEmailTokenEntity response = await _ref.read(getEmailTokenUseCaseProvider).call(email);
      state = state.copyWith(isBtnLoading: false);
      if (response.status != null && response.status!) {
        String token = response.data!.token.toString();
        state = state.copyWith(
            email: email,
        );
        print(token);
        return true;
      }
      state = state.copyWith(errorStr: response.message.toString());
    }
    return false;
  }

}

final createAccountControllerProvider = StateNotifierProvider<CreateAccountController, CreateAccountState>((ref) => CreateAccountController(ref));
