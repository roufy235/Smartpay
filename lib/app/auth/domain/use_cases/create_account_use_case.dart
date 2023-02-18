import 'package:smartpay/app/auth/domain/entities/create_account_entity.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';

class CreateAccountUseCase {
  final AuthRepository authRepository;

  CreateAccountUseCase({required this.authRepository});

  Future<CreateAccountEntity> call({
    required String fullName,
    required String username,
    required String email,
    required String country,
    required String password,
    required String deviceName,
  }) async => authRepository.createAccount(fullName: fullName, username: username, email: email, country: country, password: password, deviceName: deviceName);

}
