import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/network/api_provider.dart';

final apiProviderProvider = Provider<ApiProvider>((ref) => ApiProvider());
