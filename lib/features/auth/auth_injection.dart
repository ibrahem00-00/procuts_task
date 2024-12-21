import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection_container.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/get_user_role_usecase.dart';
import 'domain/usecases/save_user_role.dart';

import 'domain/usecases/get_user_type_usecase.dart';
import 'domain/usecases/save_user_type_usecase.dart';
import 'presentation/cubit/auto_login/auto_login_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initAuthFeatureInjection() async {
  ///-> Cubits

  _sl.registerLazySingleton<AutoLoginCubit>(() => AutoLoginCubit(
        getUserTypeUseCase: _sl(),
        saveUserTypeUseCase: _sl(),
        getUserRoleUseCase: _sl(),
        saveUserRoleUseCase: _sl(),
      ));

  ///-> UseCases

  _sl.registerLazySingleton<GetUserTypeUseCase>(
      () => GetUserTypeUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetUserRoleUseCase>(
      () => GetUserRoleUseCase(repository: _sl()));
  _sl.registerLazySingleton<SaveUserTypeUseCase>(
      () => SaveUserTypeUseCase(repository: _sl()));
  _sl.registerLazySingleton<SaveUserRoleUseCase>(
      () => SaveUserRoleUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get authBlocs => <BlocProvider>[
      BlocProvider<AutoLoginCubit>(
        create: (BuildContext context) => _sl<AutoLoginCubit>(),
      ),
    ];
