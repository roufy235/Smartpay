import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source.dart';
import 'package:smartpay/app/auth/domain/entities/create_account_entity.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/entities/login_entity.dart';
import 'package:smartpay/app/auth/domain/entities/verify_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRepositoryDataSource authRepositoryDataSource;
  AuthRepositoryImpl({required this.authRepositoryDataSource});

  @override
  Future<GetEmailTokenEntity> getEmailToken(String email) async {
    return authRepositoryDataSource.getEmailToken(email);
  }

  @override
  Future<VerifyEmailTokenEntity> verifyEmailToken({required String email, required String token}) async {
    return authRepositoryDataSource.verifyEmailToken(email: email, token: token);
  }

  @override
  Future<CreateAccountEntity> createAccount({required String fullName, required String username, required String email, required String country, required String password, required String deviceName}) async {
    return authRepositoryDataSource.createAccount(fullName: fullName, username: username, email: email, country: country, password: password, deviceName: deviceName);
  }

  @override
  Future<LoginEntity> userLogin({required String email, required String password, required String deviceName}) {
    return authRepositoryDataSource.userLogin(email: email, password: password, deviceName: deviceName);
  }

}
