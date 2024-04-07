// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i4;

import '../core/dio/iconfig.dart' as _i5;
import '../core/dio/third_party.dart' as _i14;
import '../features/auth/data/datasource/authsignup_remote_datasource.dart'
    as _i7;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i9;
import '../features/auth/domain/repository/auth_repository.dart' as _i8;
import '../features/auth/domain/usecase/auth_signup.dart' as _i10;
import '../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i11;
import 'network_info_di.dart' as _i13;
import 'secure_storage_di.dart' as _i12;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final secureStorageInjection = _$SecureStorageInjection();
  final networkInfoInjection = _$NetworkInfoInjection();
  final dioBase = _$DioBase();
  gh.factory<_i3.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.factory<_i4.InternetConnectionCheckerPlus>(
      () => networkInfoInjection.networkInfo);
  gh.singleton<_i5.IConfig>(
    () => _i5.StagingConfig(),
    registerFor: {_staging},
  );
  gh.singleton<_i5.IConfig>(
    () => _i5.ProdConfig(),
    registerFor: {_production},
  );
  gh.singleton<_i5.IConfig>(
    () => _i5.DevConfig(),
    registerFor: {_development},
  );
  gh.lazySingleton<_i6.Dio>(() => dioBase.dio(gh<_i5.IConfig>()));
  gh.lazySingleton<_i7.AuthRemoteDataSource>(
      () => _i7.AuthSignUpRemoteDataSourceImpl(dio: gh<_i6.Dio>()));
  gh.lazySingleton<_i8.AuthRepository>(() => _i9.AuthRepositoryImpl(
      authRemoteDataSource: gh<_i7.AuthRemoteDataSource>()));
  gh.factory<_i10.AuthSignUpUseCase>(
      () => _i10.AuthSignUpUseCase(gh<_i8.AuthRepository>()));
  gh.factory<_i11.AuthBloc>(
      () => _i11.AuthBloc(authSignUp: gh<_i10.AuthSignUpUseCase>()));
  return getIt;
}

class _$SecureStorageInjection extends _i12.SecureStorageInjection {}

class _$NetworkInfoInjection extends _i13.NetworkInfoInjection {}

class _$DioBase extends _i14.DioBase {}
