import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:smartpay/app/on_boarding/data/data_sources/on_boarding_data_source_impl.dart';
import 'package:smartpay/app/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:smartpay/app/on_boarding/domain/use_cases/get_data_user_case.dart';

final onBoardingDataSourceProvider = Provider<OnBoardingDataSource>((ref) => OnBoardingDataSourceImpl());
final onBoardingRepositoryProvider = Provider((ref) => OnBoardingRepositoryImpl(onBoardingDataSource: ref.read(onBoardingDataSourceProvider)));
final getDataUseCaseProvider = Provider((ref) => GetDataUseCase(onBoardingRepository: ref.read(onBoardingRepositoryProvider)));
