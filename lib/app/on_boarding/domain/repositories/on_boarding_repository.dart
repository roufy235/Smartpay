import 'package:smartpay/app/on_boarding/domain/entities/item_entity.dart';

abstract class OnBoardingRepository{
  List<ItemEntity> getData();
}
