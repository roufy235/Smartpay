import 'package:smartpay/app/dashboard/domain/entities/dashboard_entity.dart';
import 'package:smartpay/app/dashboard/domain/repositories/dashboard_repository.dart';

class GetSecretMessageUseCase {
  final DashboardRepository dashboardRepository;

  GetSecretMessageUseCase({required this.dashboardRepository});

  Future<DashboardEntity> call() async => dashboardRepository.getSecretMessage();

}
