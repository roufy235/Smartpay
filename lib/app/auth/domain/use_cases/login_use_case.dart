import 'package:smartpay/app/auth/domain/entities/login_entity.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<LoginEntity> call({
    required String email,
    required String password,
    required String deviceName,
  }) async => authRepository.userLogin(email: email, password: password, deviceName: deviceName);
}
