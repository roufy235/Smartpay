import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartpay/app_theme.dart';
import 'package:smartpay/config/configs.dart';

import 'router/router.dart';

class SmartPayApp extends ConsumerStatefulWidget {
  const SmartPayApp({Key? key}) : super(key: key);

  @override
  ConsumerState<SmartPayApp> createState() => _SmartPayAppState();
}

class _SmartPayAppState extends ConsumerState<SmartPayApp> {
  late GoRouter _goRouter;

  @override
  void initState() {
    _goRouter = AppRouter(ref: ref).router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _goRouter.routerDelegate,
      routeInformationParser: _goRouter.routeInformationParser,
      routeInformationProvider: _goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: AppStrings.kAppName,
      theme: AppTheme.lightTheme(context: context),
    );
  }
}
