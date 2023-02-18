import 'package:smartpay/app/auth/domain/entities/create_account_entity.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/entities/login_entity.dart';
import 'package:smartpay/app/auth/domain/entities/verify_email_token_entity.dart';

abstract class AuthRepository {
  Future<GetEmailTokenEntity> getEmailToken(String email);

  Future<VerifyEmailTokenEntity> verifyEmailToken({
    required String email,
    required String token
  });

  Future<CreateAccountEntity> createAccount({
    required String fullName,
    required String username,
    required String email,
    required String country,
    required String password,
    required String deviceName,
  });

  Future<LoginEntity> userLogin({
    required String email,
    required String password,
    required String deviceName,
  });
}
