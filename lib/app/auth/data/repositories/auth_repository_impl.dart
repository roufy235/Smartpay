import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRepositoryDataSource authRepositoryDataSource;
  AuthRepositoryImpl({required this.authRepositoryDataSource});

  @override
  Future<GetEmailTokenEntity> getEmailToken(String email) async {
    return authRepositoryDataSource.getEmailToken(email);
  }

}
