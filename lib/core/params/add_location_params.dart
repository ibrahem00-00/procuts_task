import 'package:equatable/equatable.dart';

class AddLocationParams extends Equatable {
  final String? locationId;
  final String? name;
  final int? cityId;
  final int? countryId;
  final int? regionId;
  final String? area;
  final String? street;
  final String? buildingNo;
  final String? apartmentNo;
  final String? notice;

  const AddLocationParams({
    this.locationId,
    this.name,
    this.cityId,
    this.countryId,
    this.regionId,
    this.area,
    this.street,
    this.buildingNo,
    this.apartmentNo,
    this.notice,
  });

  AddLocationParams copyWith({
    String? locationId,
    String? name,
    String? countryId,
    int? cityId,
    int? regionId,
    String? area,
    String? street,
    String? buildingNo,
    String? apartmentNo,
    String? notice,
  }) =>
      AddLocationParams(
        locationId: this.locationId,
        name: this.name,
        countryId: this.countryId,
        cityId: this.cityId,
        regionId: this.regionId,
        area: this.area,
        street: this.street,
        buildingNo: this.buildingNo,
        apartmentNo: this.apartmentNo,
        notice: this.notice,
      );

  @override
  List<Object?> get props => [
    locationId,
        name,
        countryId,
        cityId,
    regionId,
    area,
    street,
    buildingNo,
    apartmentNo,
    notice,
      ];
}
