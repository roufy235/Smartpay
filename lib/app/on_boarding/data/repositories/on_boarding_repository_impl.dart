import 'package:smartpay/app/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:smartpay/app/on_boarding/domain/entities/item_entity.dart';
import 'package:smartpay/app/on_boarding/domain/repositories/on_boarding_repository.dart';

class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingDataSource onBoardingDataSource;

  OnBoardingRepositoryImpl({required this.onBoardingDataSource});
  @override
  List<ItemEntity> getData() => onBoardingDataSource.getData();

}
