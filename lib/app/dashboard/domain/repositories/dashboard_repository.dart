import 'package:smartpay/app/dashboard/domain/entities/dashboard_entity.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getSecretMessage();
}
