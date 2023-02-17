import 'package:smartpay/app/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:smartpay/app/on_boarding/data/models/item_model.dart';
import 'package:smartpay/generated/assets.dart';

class OnBoardingDataSourceImpl implements OnBoardingDataSource {
  @override
  List<ItemModel> getData() {
    return [
      ItemModel(
          isSvg: false,
          phoneImage: Assets.imagesDevice,
          img: Assets.svgIllustration,
          title: 'Finance app the safest and most trusted',
          content:
              'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.'),
      ItemModel(
          isSvg: false,
          phoneImage: Assets.imagesDevice2,
          img: Assets.svgIllustration2,
          title: 'The fastest transaction process only here',
          content:
              'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.'),
    ];
  }
}
