import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source.dart';
import 'package:smartpay/app/auth/data/remote/models/create_account_model.dart';
import 'package:smartpay/app/auth/data/remote/models/get_email_token_model.dart';
import 'package:smartpay/app/auth/data/remote/models/login_model.dart';
import 'package:smartpay/app/auth/data/remote/models/verify_email_token_model.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/network/api_provider.dart';

class AuthRepositoryDataSourceImpl implements AuthRepositoryDataSource {
  final Ref ref;
  late final ApiProvider _apiProvider;
  late final String _authToken;
  AuthRepositoryDataSourceImpl({required this.ref}) {
    _apiProvider = ref.read(apiProviderProvider);
    _authToken = ref.read(userAuthTokenProvider);
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

  @override
  Future<CreateAccountModel> createAccount({
    required String fullName, required String username,
    required String email, required String country,
    required String password, required String deviceName
  }) async {
    Map<String, dynamic> requestData = {
      'full_name': fullName,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
      'device_name': deviceName,
    };
    final response = await _apiProvider.post('/auth/register', requestData, _authToken);
    try {
      return CreateAccountModel.fromJson(response);
    } catch (e) {
      try {
        final errors = CreateAccountModelErrors.fromJson(response['errors']);
        return CreateAccountModel(status: null, message: response['message'], data: null, errors: errors);
      } catch (e) {
        return CreateAccountModel(status: null, message: response['message'], data: null, errors: null);
      }
    }
  }

  @override
  Future<LoginModel> userLogin({required String email, required String password, required String deviceName}) async {
    Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
      'device_name': deviceName,
    };
    final response = await _apiProvider.post('/auth/login', requestData, _authToken);
    try {
      return LoginModel.fromJson(response);
    } catch (e) {
      try {
        final errors = LoginModelErrors.fromJson(response['errors']);
        return LoginModel(status: null, message: response['message'], data: null, errors: errors);
      } catch (e) {
        return LoginModel(status: null, message: response['message'], data: null, errors: null);
      }
    }
  }

}
