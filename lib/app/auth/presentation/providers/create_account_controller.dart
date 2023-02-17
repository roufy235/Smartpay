import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/presentation/providers/common.dart';
import 'package:smartpay/app/auth/presentation/providers/freezed/create_account_state.dart';

class CreateAccountController extends StateNotifier<CreateAccountState> {
  final Ref _ref;
  CreateAccountController(this._ref): super(const CreateAccountState());





  Future<bool> getEmailToken({required String email}) async {
    if (email.isNotEmpty) {
      state = state.copyWith(isBtnLoading: true);
      GetEmailTokenEntity response = await _ref.read(getEmailTokenUseCaseProvider).call(email);
      state = state.copyWith(isBtnLoading: false);
      if (response.status != null && response.status!) {
        print(response.data!.token.toString());
        print(email);
        return true;
      }
      state = state.copyWith(errorStr: response.message.toString());
    }
    return false;
  }

}

final createAccountControllerProvider = StateNotifierProvider<CreateAccountController, CreateAccountState>((ref) => CreateAccountController(ref));
