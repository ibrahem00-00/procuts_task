import 'package:dartz/dartz.dart';
import 'package:procuts_task/core/base_classes/base_list_response.dart';
import 'package:procuts_task/core/error/exceptions.dart';
import 'package:procuts_task/core/error/failures.dart';
import 'package:procuts_task/core/params/filter_params.dart';
import 'package:procuts_task/core/utils/log_utils.dart';
import 'package:procuts_task/core/utils/values/strings.dart';
import 'package:procuts_task/features/products/data/datasources/product_remote_data_source.dart';
import 'package:procuts_task/features/products/domain/repositories/product_repository.dart';
import 'package:procuts_task/injection_container.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  ProductRepositoryImpl({required this.remote});
  @override
  Future<Either<Failure, BaseListResponse>> getProducts(
      {required FilterParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        BaseListResponse responseRepo =
            await remote.getProducts(params: params);
        return Right(responseRepo);
      } on AppException catch (error) {
        Log.e(
            '[getProducts] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }
}
