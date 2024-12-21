import 'package:equatable/equatable.dart';

class CountryParams extends Equatable {
  final String? name;
  final String? id;
  final String? isoCode;
  final String? callingCode;

  const CountryParams({
    this.id,
    this.isoCode,
    this.callingCode,
    this.name,
  });
  @override
  List<Object?> get props => [
        name,
        id,
        isoCode,
        callingCode,
      ];
}
