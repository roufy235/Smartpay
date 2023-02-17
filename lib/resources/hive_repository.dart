import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartpay/config/configs.dart';

class HiveRepository {
  final Ref _ref;
  HiveRepository(this._ref);
  final Box _box = Hive.box(AppStrings.kBoxName);

}
