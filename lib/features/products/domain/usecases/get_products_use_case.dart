import 'package:dartz/dartz.dart';
import 'package:procuts_task/core/params/filter_params.dart';
import 'package:procuts_task/features/products/domain/repositories/product_repository.dart';

import '../../../../core/base_classes/base_list_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetProductsUseCase implements UseCase<BaseListResponse, FilterParams> {
  final ProductRepository productRepository;
  GetProductsUseCase({required this.productRepository});

  @override
  Future<Either<Failure, BaseListResponse>> call(FilterParams params) =>
      productRepository.getProducts(params: params);
}
