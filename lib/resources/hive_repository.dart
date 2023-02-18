import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/config/configs.dart';

class HiveRepository {
  final Ref _ref;
  HiveRepository(this._ref);
  final Box _box = Hive.box(AppStrings.kBoxName);

  final String _pinBox = 'pinBox';
  final String _setUserAuthToken = '_setUserAuthToken';

  String getPin() => (_box.get(_pinBox) ?? '');
  Future<bool> setPin(String value) async {
    await _box.put(_pinBox, value);
    return true;
  }

  String getUserAuthToken() => (_box.get(_setUserAuthToken) ?? '');
  Future<bool> setUserAuthToken(String value) async {
    await _box.put(_setUserAuthToken, value);
    _ref.read(userAuthTokenProvider.notifier).state = value;
    return true;
  }

}
