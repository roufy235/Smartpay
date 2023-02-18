import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/dashboard/data/data_sources/dashboard_data_source.dart';
import 'package:smartpay/app/dashboard/data/models/dashboard_model.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/network/api_provider.dart';

class DashboardDataSourceImpl implements DashboardDataSource {
  final Ref ref;
  late final ApiProvider _apiProvider;
  late final String _authToken;
  DashboardDataSourceImpl({required this.ref}) {
    _apiProvider = ref.read(apiProviderProvider);
    _authToken = ref.read(userAuthTokenProvider);
  }

  @override
  Future<DashboardModel> getSecretMessage() async {
    final response = await _apiProvider.get('/dashboard', _authToken);
    try {
      return DashboardModel.fromJson(response);
    } catch (e) {
      return DashboardModel(status: null, message: response['message'], data: null);
    }
  }

}
