import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';

class GetEmailTokenUseCase{
  final AuthRepository authRepository;
  GetEmailTokenUseCase({required this.authRepository});

  Future<GetEmailTokenEntity> call(String email) async {
    return authRepository.getEmailToken(email);
  }
}
