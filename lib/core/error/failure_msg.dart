// ignore_for_file: type_literal_in_constant_pattern

import 'dart:convert';

import 'package:procuts_task/core/error/error_auth.dart';

import '../utils/app_strings.dart';
import '../utils/log_utils.dart';
import 'failures.dart';

class FailureMsg {
  static String mapFailureToMsg(Failure failure) {
    Log.e(
        "failure ---- ${failure.runtimeType} ---- ${failure.message.toString()}");
    switch (failure.runtimeType) {
      case CreatedErrorFailure:
        return failure.message.toString();
      case DataInputFailure:
        final jsonError = json.decode(failure.message.toString());

        if (jsonError["data"] == null) {
          if (jsonError['message'] != null) {
            return jsonError['message'].toString();
          } else if (jsonError['non_field_errors'] != null) {
            return jsonError['non_field_errors'].toString();
          } else {
            return jsonError.toString();
          }
        } else {
          AuthError authError = AuthError.fromJson(jsonError);
          String error = '';
          if (authError.data?.email != null) {
            error = "$error${authError.data!.email?.first}\n";
          }
          if (authError.data?.phoneNumber != null) {
            error = "$error${authError.data!.phoneNumber?.first}\n";
          }
          if (authError.data?.name != null) {
            error = "$error${authError.data!.name}\n";
          }
          if (authError.data?.password != null) {
            error = "$error${authError.data!.password}\n";
          }
          if (authError.data?.image != null) {
            error = "$error${authError.data!.image}";
          }
          if (authError.data?.file != null) {
            error = "$error${authError.data!.file}";
          }
          if (authError.data?.optionId != null) {
            error = "$error${authError.data!.optionId}";
          }
          if (authError.data?.workingDays != null) {
            error = "$error${authError.data!.workingDays}";
          }

          return error.toString().trim();
        }
      case UnauthorizedFailure:
        return AppStrings.unAuthorizedFailure;
      case ServerFailure:
        final jsonError = json.decode(failure.message.toString());
        if (jsonError["message"] == AppStrings.tokenFailure) {
          return AppStrings.unAuthorizedFailure;
        } else {
          return AppStrings.serverFailure;
        }
      case CacheFailure:
        return AppStrings.cacheFailure;
      case NetworkFailure:
        return AppStrings.networkError;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
