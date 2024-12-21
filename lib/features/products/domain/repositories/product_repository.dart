import 'package:dartz/dartz.dart';
import 'package:procuts_task/core/base_classes/base_list_response.dart';
import 'package:procuts_task/core/error/failures.dart';
import 'package:procuts_task/core/params/filter_params.dart';

abstract class ProductRepository {
  Future<Either<Failure, BaseListResponse>> getProducts(
      {required FilterParams params});
}
