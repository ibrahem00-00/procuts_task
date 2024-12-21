import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuts_task/features/tabBar/presentation/cubit/tabbar_cubit/tabbar_cubit.dart';

import '../../injection_container.dart';
import 'data/datasources/tabbar_remote_data_source.dart';
import 'data/repositories/tabbar_repository_impl.dart';
import 'domain/repositories/tabbar_repository.dart';

final _sl = ServiceLocator.instance;

Future<void> initTabBarFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<TabbarCubit>(() => TabbarCubit());

  ///-> Repository
  _sl.registerLazySingleton<TabBarRepository>(
      () => TabBarRepositoryImpl(remoteDataSource: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<TabBarRemoteDataSource>(
      () => TabBarRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get tabBarBlocs => <BlocProvider>[
      BlocProvider<TabbarCubit>(
        create: (BuildContext context) => _sl<TabbarCubit>(),
      ),
    ];
