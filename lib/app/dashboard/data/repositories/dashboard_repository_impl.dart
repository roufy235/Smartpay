import 'package:smartpay/app/dashboard/data/data_sources/dashboard_data_source.dart';
import 'package:smartpay/app/dashboard/domain/entities/dashboard_entity.dart';
import 'package:smartpay/app/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository{
  final DashboardDataSource dashboardDataSource;

  DashboardRepositoryImpl({required this.dashboardDataSource});
  @override
  Future<DashboardEntity> getSecretMessage() async => dashboardDataSource.getSecretMessage();

}
