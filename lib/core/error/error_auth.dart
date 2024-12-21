class AuthError {
  AuthError({
    this.success,
    this.message,
    this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  AuthError copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      AuthError(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AuthError.fromJson(Map<String, dynamic> json) => AuthError(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.image,
    this.file,
    this.optionId,
    this.workingDays,
    this.cpr,
    this.requestId,
  });

  final List<String>? name;
  final List<String>? email;
  final List<String>? password;
  final List<String>? phoneNumber;
  final List<String>? image;
  final List<String>? file;
  final List<String>? optionId;
  final List<String>? workingDays;
  final List<String>? cpr;
  final List<String>? requestId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"] == null
            ? null
            : List<String>.from(json["email"].map((x) => x)),
        password: json["password"],
        phoneNumber: json["phone"] == null
            ? null
            : List<String>.from(json["phone"].map((x) => x)),
        requestId: json["request_id"] == null
            ? null
            : List<String>.from(json["request_id"].map((x) => x)),
        image: json["image"],
        file: json["file"],
        optionId: json["option_id"],
        workingDays: json['working_days'],
        cpr: json["cpr"] == null
            ? []
            : List<String>.from(json["cpr"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phoneNumber,
        "image": image,
        "file": file,
        "option_id": optionId,
        "working_days": workingDays,
      };
}
