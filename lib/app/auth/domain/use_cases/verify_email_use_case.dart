import 'package:smartpay/app/auth/domain/entities/verify_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';

class VerifyEmailUseCase {
  final AuthRepository authRepository;

  VerifyEmailUseCase({required this.authRepository});

  Future<VerifyEmailTokenEntity> call({
    required String email,
    required String token
  }) async => authRepository.verifyEmailToken(email: email, token: token);

}
