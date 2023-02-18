import 'package:smartpay/app/dashboard/data/models/dashboard_model.dart';

abstract class DashboardDataSource {
  Future<DashboardModel> getSecretMessage();
}
