import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;
  final String? passwordConfirmation;
   const AuthParams({

    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
  });
  
  @override
  List<Object?> get props => <Object?>[
    firstName,
    lastName,
    email,
    phone,
    password,
    passwordConfirmation
  ];
}
