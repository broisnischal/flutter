// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/dio/iconfig.dart' as _i4;
import '../core/dio/third_party.dart' as _i18;
import '../features/auth/data/datasource/authsignup_remote_datasource.dart'
    as _i7;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i13;
import '../features/auth/domain/repository/auth_repository.dart' as _i12;
import '../features/auth/domain/usecase/auth_signup.dart' as _i14;
import '../features/auth/domain/usecase/otp_verify.dart' as _i15;
import '../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i16;
import '../features/profile/data/datasources/home_remote_datasources.dart'
    as _i6;
import '../features/profile/data/repositories/home_repository_impl.dart' as _i9;
import '../features/profile/domain/repository/home_repository.dart' as _i8;
import '../features/profile/domain/usecases/get_calendar.dart' as _i10;
import '../features/profile/presentation/bloc/home_bloc.dart' as _i11;
import 'secure_storage_di.dart' as _i17;

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
  final dioBase = _$DioBase();
  gh.factory<_i3.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.singleton<_i4.IConfig>(
    () => _i4.StagingConfig(),
    registerFor: {_staging},
  );
  gh.singleton<_i4.IConfig>(
    () => _i4.ProdConfig(),
    registerFor: {_production},
  );
  gh.singleton<_i4.IConfig>(
    () => _i4.DevConfig(),
    registerFor: {_development},
  );
  gh.lazySingleton<_i5.Dio>(() => dioBase.dio(gh<_i4.IConfig>()));
  gh.lazySingleton<_i6.HomeRemoteDataSource>(
      () => _i6.HomeRemoteDataSourceImpl(dio: gh<_i5.Dio>()));
  gh.lazySingleton<_i7.AuthRemoteDataSource>(
      () => _i7.AuthSignUpRemoteDataSourceImpl(dio: gh<_i5.Dio>()));
  gh.lazySingleton<_i8.HomeRepository>(() => _i9.HomeRepositoryImpl(
      homeRemoteDatasource: gh<_i6.HomeRemoteDataSource>()));
  gh.factory<_i10.GetCalendar>(
      () => _i10.GetCalendar(homeRepository: gh<_i8.HomeRepository>()));
  gh.factory<_i11.HomeBloc>(
      () => _i11.HomeBloc(getCalendar: gh<_i10.GetCalendar>()));
  gh.lazySingleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
      authRemoteDataSource: gh<_i7.AuthRemoteDataSource>()));
  gh.factory<_i14.AuthSignUpUseCase>(
      () => _i14.AuthSignUpUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i15.OTPVerifyUseCase>(
      () => _i15.OTPVerifyUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(
        authSignUp: gh<_i14.AuthSignUpUseCase>(),
        otpVerify: gh<_i15.OTPVerifyUseCase>(),
      ));
  return getIt;
}

class _$SecureStorageInjection extends _i17.SecureStorageInjection {}

class _$DioBase extends _i18.DioBase {}
