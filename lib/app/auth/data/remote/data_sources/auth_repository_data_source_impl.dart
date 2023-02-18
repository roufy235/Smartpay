import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source.dart';
import 'package:smartpay/app/auth/data/remote/models/get_email_token_model.dart';
import 'package:smartpay/app/auth/data/remote/models/verify_email_token_model.dart';
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
  Future<GetEmailTokenModel> getEmailToken(String email) async {
    Map<String, dynamic> requestData = {
      'email': email
    };
    final response = await _apiProvider.post('/auth/email', requestData, _authToken);
    try {
      return GetEmailTokenModel.fromJson(response);
    } catch (e) {
      return GetEmailTokenModel(status: null, message: '', data: null);
    }
  }

  @override
  Future<VerifyEmailTokenModel> verifyEmailToken({required String email, required String token}) async {
    Map<String, dynamic> requestData = {
      'email': email,
      'token': token
    };
    final response = await _apiProvider.post('/auth/email/verify', requestData, _authToken);
    try {
      return VerifyEmailTokenModel.fromJson(response);
    } catch (e) {
      return VerifyEmailTokenModel(status: null, message: response['message'], data: null);
    }
  }

}
