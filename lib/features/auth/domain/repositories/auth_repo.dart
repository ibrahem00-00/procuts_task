import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../usecases/save_user_type_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserType>> getUserType({
    required NoParams params,
  });

  Future<Either<Failure, bool>> saveUserType({
    required SaveUserTypeParams params,
  });
  Future<Either<Failure, UserType>> getUserRole({
    required NoParams params,
  });

  Future<Either<Failure, bool>> saveUserRole({
    required SaveUserTypeParams params,
  });
}
