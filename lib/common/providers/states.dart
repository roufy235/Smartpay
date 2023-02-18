import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/network/api_provider.dart';
import 'package:smartpay/resources/hive_repository.dart';

final apiProviderProvider = Provider<ApiProvider>((ref) => ApiProvider());
final hiveRepositoryProvider = Provider<HiveRepository>((ref) => HiveRepository(ref));
final userAuthTokenProvider = StateProvider<String>((ref) {
  return ref.read(hiveRepositoryProvider).getUserAuthToken();
});
