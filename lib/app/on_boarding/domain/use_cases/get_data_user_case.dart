import 'package:smartpay/app/on_boarding/domain/entities/item_entity.dart';
import 'package:smartpay/app/on_boarding/domain/repositories/on_boarding_repository.dart';

class GetDataUseCase {
  final OnBoardingRepository onBoardingRepository;
  GetDataUseCase({required this.onBoardingRepository});

  List<ItemEntity> call() => onBoardingRepository.getData();
}
