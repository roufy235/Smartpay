import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState({
    @Default(false) bool isBtnLoading,
    @Default(false) bool isSignUpBtnLoading,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool emailVerBtnLoading,
    @Default('') String errorStr,
    @Default('') String email,
    @Default('') String selectedCountry,
    @Default('') String selectedCountryCode,
  }) = _CreateAccountState;

}
