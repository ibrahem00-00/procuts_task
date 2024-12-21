import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuts_task/features/products/data/datasources/product_remote_data_source.dart';
import 'package:procuts_task/features/products/data/repositories/product_repository_impl.dart';
import 'package:procuts_task/features/products/domain/repositories/product_repository.dart';
import 'package:procuts_task/features/products/domain/usecases/get_products_use_case.dart';

import 'package:procuts_task/features/products/presentation/bloc/auto_search_bloc/get_products_bloc.dart';

import '../../injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initProductFeatureInjection() async {
  ///-> Cubits

  _sl.registerFactory<GetProductsBloc>(
      () => GetProductsBloc(getProductsUseCase: _sl()));

  ///-> UseCases

  _sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(productRepository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get productBlocs => <BlocProvider>[
      BlocProvider<GetProductsBloc>(
        create: (BuildContext context) => _sl<GetProductsBloc>(),
      ),
    ];
