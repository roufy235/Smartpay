import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/entities/verify_email_token_entity.dart';

abstract class AuthRepository {
  Future<GetEmailTokenEntity> getEmailToken(String email);

  Future<VerifyEmailTokenEntity> verifyEmailToken({
    required String email,
    required String token
  });
}
