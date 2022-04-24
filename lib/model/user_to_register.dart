import 'package:json_annotation/json_annotation.dart';

part 'user_to_register.g.dart';

@JsonSerializable()
class UserToRegister {
  UserToRegister(
      {required this.email,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.dateOfBirth,
      required this.seriesDriverLicense,
      required this.numberDriverLicense,
      required this.dateOfIssueDriverLicense,
      required this.issuedByDriverLicense,
      required this.seriesPassport,
      required this.numberPassport,
      required this.dateOfIssuePassport,
      required this.issuedByPassport,
      required this.password});

  late String email;
  late String lastName;
  late String firstName;
  late String middleName;
  late DateTime dateOfBirth;
  late String seriesDriverLicense;
  late String numberDriverLicense;
  late DateTime dateOfIssueDriverLicense;
  late String issuedByDriverLicense;
  late String seriesPassport;
  late String numberPassport;
  late DateTime dateOfIssuePassport;
  late String issuedByPassport;
  late String password;

  // Map<String, dynamic> toMap(){
  //   return{
  //
  //   }
  // }

  factory UserToRegister.fromJson(Map<String, dynamic> data) =>
      _$UserToRegisterFromJson(data);

  Map<String, dynamic> toJson() => _$UserToRegisterToJson(this);
}
