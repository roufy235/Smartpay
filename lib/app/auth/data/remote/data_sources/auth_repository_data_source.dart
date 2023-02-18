import 'package:smartpay/app/auth/data/remote/models/verify_email_token_model.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';

abstract class AuthRepositoryDataSource {
  Future<GetEmailTokenEntity> getEmailToken(String email);
  Future<VerifyEmailTokenModel> verifyEmailToken({
    required String email,
    required String token
  });
}
