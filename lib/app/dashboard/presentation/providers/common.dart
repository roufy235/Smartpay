import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/dashboard/data/data_sources/dashboard_data_source.dart';
import 'package:smartpay/app/dashboard/data/data_sources/dashboard_data_source_impl.dart';
import 'package:smartpay/app/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:smartpay/app/dashboard/domain/entities/dashboard_entity.dart';
import 'package:smartpay/app/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:smartpay/app/dashboard/domain/use_cases/get_secret_message_use_case.dart';

// data source provider
final dashboardDataSourceProvider = Provider<DashboardDataSource>((ref) => DashboardDataSourceImpl(ref: ref));
// repository provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) => DashboardRepositoryImpl(dashboardDataSource: ref.read(dashboardDataSourceProvider)));
// use cases providers
final getSecretMessageUseCaseProvider = Provider<GetSecretMessageUseCase>((ref) => GetSecretMessageUseCase(dashboardRepository: ref.read(dashboardRepositoryProvider)));

final getMessageProvider = FutureProvider<DashboardEntity>((ref) {
  return ref.read(getSecretMessageUseCaseProvider).call();
});
