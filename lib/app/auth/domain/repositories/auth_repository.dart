import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';

abstract class AuthRepository {
  Future<GetEmailTokenEntity> getEmailToken(String email);
}
