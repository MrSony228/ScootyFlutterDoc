// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_to_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserToRegister _$UserToRegisterFromJson(Map<String, dynamic> json) =>
    UserToRegister(
      email: json['email'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      seriesDriverLicense: json['seriesDriverLicense'] as String,
      numberDriverLicense: json['numberDriverLicense'] as String,
      dateOfIssueDriverLicense:
          DateTime.parse(json['dateOfIssueDriverLicense'] as String),
      issuedByDriverLicense: json['issuedByDriverLicense'] as String,
      seriesPassport: json['seriesPassport'] as String,
      numberPassport: json['numberPassport'] as String,
      dateOfIssuePassport:
          DateTime.parse(json['dateOfIssuePassport'] as String),
      issuedByPassport: json['issuedByPassport'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserToRegisterToJson(UserToRegister instance) =>
    <String, dynamic>{
      'email': instance.email,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'seriesDriverLicense': instance.seriesDriverLicense,
      'numberDriverLicense': instance.numberDriverLicense,
      'dateOfIssueDriverLicense':
          instance.dateOfIssueDriverLicense.toIso8601String(),
      'issuedByDriverLicense': instance.issuedByDriverLicense,
      'seriesPassport': instance.seriesPassport,
      'numberPassport': instance.numberPassport,
      'dateOfIssuePassport': instance.dateOfIssuePassport.toIso8601String(),
      'issuedByPassport': instance.issuedByPassport,
      'password': instance.password,
    };
