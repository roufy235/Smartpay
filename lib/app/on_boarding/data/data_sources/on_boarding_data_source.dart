import 'package:smartpay/app/on_boarding/data/models/item_model.dart';

abstract class OnBoardingDataSource {
  List<ItemModel> getData();
}
