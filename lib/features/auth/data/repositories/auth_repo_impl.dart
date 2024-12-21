import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/log_utils.dart' as log;
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/save_user_type_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({
    required this.remote,
  });

  /// Impl

  @override
  Future<Either<Failure, UserType>> getUserType(
      {required NoParams params}) async {
    try {
      UserType userType = sharedPreferences.getUserType();
      return Right<Failure, UserType>(userType);
    } on AppException catch (error) {
      log.Log.e(
          '[getUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UserType>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserType(
      {required SaveUserTypeParams params}) async {
    try {
      bool result = await sharedPreferences.saveUserType(params.type);
      return Right<Failure, bool>(result);
    } on AppException catch (error) {
      log.Log.e(
          '[saveUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, UserType>> getUserRole(
      {required NoParams params}) async {
    try {
      UserType userType = sharedPreferences.getUserRole();
      return Right<Failure, UserType>(userType);
    } on AppException catch (error) {
      log.Log.e(
          '[getUserRole] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UserType>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserRole(
      {required SaveUserTypeParams params}) async {
    try {
      bool result = await sharedPreferences.saveUserRole(params.type);
      return Right<Failure, bool>(result);
    } on AppException catch (error) {
      log.Log.e(
          '[saveUserRole] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }
}
