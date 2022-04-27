// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingPlaces _$ParkingPlacesFromJson(Map<String, dynamic> json) =>
    ParkingPlaces(
      id: json['id'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius: (json['radius'] as num).toDouble(),
      transports: (json['transports'] as List<dynamic>)
          .map((e) => Transport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParkingPlacesToJson(ParkingPlaces instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
      'transports': instance.transports,
    };
