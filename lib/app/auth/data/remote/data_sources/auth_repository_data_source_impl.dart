import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source.dart';
import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/network/api_provider.dart';

class AuthRepositoryDataSourceImpl extends AuthRepositoryDataSource {
  final Ref ref;
  late final ApiProvider _apiProvider;
  late final String _authToken;
  AuthRepositoryDataSourceImpl({required this.ref}) {
    _apiProvider = ref.read(apiProviderProvider);
    _authToken = '';
  }

  @override
  Future<GetEmailTokenEntity> getEmailToken(String email) async {
    Map<String, dynamic> requestData = {
      'email': email
    };
    final response = await _apiProvider.post('/auth/email', requestData, _authToken);
    try {
      return GetEmailTokenEntity.fromJson(response);
    } catch (e) {
      print(e.toString());
      return GetEmailTokenEntity(status: null, message: '', data: null);
    }
  }

}
