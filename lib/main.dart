import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartpay/config/strings.dart';
import 'package:smartpay/smartpay_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppStrings.kBoxName);
  runApp(const ProviderScope(child: SmartPayApp()));
}

