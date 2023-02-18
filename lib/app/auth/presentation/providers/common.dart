import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source.dart';
import 'package:smartpay/app/auth/data/remote/data_sources/auth_repository_data_source_impl.dart';
import 'package:smartpay/app/auth/data/repositories/auth_repository_impl.dart';
import 'package:smartpay/app/auth/domain/repositories/auth_repository.dart';
import 'package:smartpay/app/auth/domain/use_cases/get_email_token_use_case.dart';
import 'package:smartpay/app/auth/domain/use_cases/verify_email_use_case.dart';


// data source
final authRepositoryDataSourceProvider = Provider<AuthRepositoryDataSource>((ref) => AuthRepositoryDataSourceImpl(ref: ref));

// repository
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepositoryImpl(authRepositoryDataSource: ref.read(authRepositoryDataSourceProvider)));

//use cases
final getEmailTokenUseCaseProvider = Provider<GetEmailTokenUseCase>((ref) => GetEmailTokenUseCase(authRepository: ref.read(authRepositoryProvider)));
final verifyEmailUseCaseProvider = Provider<VerifyEmailUseCase>((ref) => VerifyEmailUseCase(authRepository: ref.read(authRepositoryProvider)));
